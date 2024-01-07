abstract class LoginEvent{}

class LoginTextChangeEvent extends LoginEvent{
  final String emailValue;
  final String passwordValue;
  LoginTextChangeEvent(this.emailValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent{
  final String email;
  final String password;

  LoginSubmittedEvent(this.email, this.password);
}

