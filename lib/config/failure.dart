class Failure {
  final String message;

  Failure(this.message);
  // email or password is wrong
  factory Failure.invalidCredentials() => Failure('Invalid credentials');
  // email is already in use
  factory Failure.emailAlreadyInUse() => Failure('Email already in use');
  // server error
  factory Failure.serverError() => Failure('Server error');
  // user is not found
  factory Failure.userNotFound() => Failure('User not found');
}
