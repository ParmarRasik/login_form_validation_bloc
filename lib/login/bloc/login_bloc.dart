import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_bloc/login/bloc/login_event.dart';
import 'package:login_form_validation_bloc/login/bloc/login_state.dart';
import 'package:login_form_validation_bloc/login/login_screen.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(): super(LoginInitialState()){

    on<LoginTextChangeEvent>((event, emit) {
      if(!event.emailValue.isValidEmail()){
        emit(LoginErrorState("Please enter valid email"));
      }else if(event.passwordValue.length < 8){
        emit(LoginErrorState("Please enter valid password"));
      }else{
        emit(LoginValidState());
      }
    },);
    on<LoginSubmittedEvent>((event, emit) {
      emit(LoginLoadingState());
    },);
  }

}