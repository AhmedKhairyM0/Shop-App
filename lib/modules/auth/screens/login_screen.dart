import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/config/space_config.dart';
import 'package:shop_app/config/utils.dart';
import 'package:shop_app/config/validation.dart';
import 'package:shop_app/core/widgets/custom_buttons.dart';
import 'package:shop_app/core/widgets/loading_indicator.dart';
import 'package:shop_app/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app/modules/auth/cubit/auth_states.dart';
import 'package:shop_app/modules/auth/widgets/custom_text_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";

  late Widget _widget = GeneralButton(
    label: "Login",
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        AuthCubit.get(context).login(
          email: _email,
          password: _password,
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            _widget = const LoadingIndicator();
          } else if (state is AuthErrorState) {
            Utils.showToast(
              message: state.message,
              type: ToastType.error,
            );
            _widget = GeneralButton(
              label: "Login",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  AuthCubit.get(context).login(
                    email: _email,
                    password: _password,
                  );
                }
              },
            );
          } else if (state is AuthSuccessState) {
            Get.toNamed(RouteGenerator.shoppingScreen);
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Login', style: Theme.of(context).textTheme.headline5),
                    Text('Welcome sign in to continue,',
                        style: Theme.of(context).textTheme.bodyText2),
                    const VerticalSpace(value: 30),
                    CustomTextForm(
                      hint: 'Email',
                      validator: Validation.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        print(email);
                        if (email != null) _email = email;
                      },
                    ),
                    const VerticalSpace(value: 15),
                    CustomTextForm(
                      hint: 'Password',
                      isNotVisable: true,
                      validator: Validation.validatePassword,
                      onSaved: (password) {
                        print(password);
                        if (password != null) _password = password;
                      },
                    ),
                    const VerticalSpace(value: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          label: "Forget password?",
                          onPressed: () {},
                          color: kGreyColor,
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 40),
                    _widget,
                    const VerticalSpace(value: 30),
                    Text(
                      'or sign in with',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const VerticalSpace(value: 15),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          icon: FontAwesomeIcons.google,
                          color: Colors.red,
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          icon: FontAwesomeIcons.facebook,
                          color: const Color(0xFF1565C0),
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          icon: FontAwesomeIcons.twitter,
                          color: Colors.blueAccent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Don't have an account?"),
                        CustomTextButton(
                          label: "Register Now",
                          onPressed: () {
                            Utils.toOffPrevious(
                                context, RouteGenerator.registerScreen);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}