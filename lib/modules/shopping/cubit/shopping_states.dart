abstract class ShoppingStates {}

class ShoppingInitialState extends ShoppingStates {}

class ShoppingScreenChanged extends ShoppingStates {}

class ShoppingLoadingState extends ShoppingStates {}

class ShoppingLoadedState extends ShoppingStates {}

class ShoppingErrorState extends ShoppingStates {
  String errorMessage;
  ShoppingErrorState({this.errorMessage = "Unknown error"});
}

class ChangedInternetStatus extends ShoppingStates {}
