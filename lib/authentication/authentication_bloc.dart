import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_login/authentication/authentication_event.dart';
import 'package:flutter_bloc_login/authentication/authentication_state.dart';
import '../user_repository.dart';
import 'package:meta/meta.dart';
class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository}):assert(userRepository!=null);

  @override
  AuthenticationState get initialState=>AuthenticationUnauthenticated();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event)async* {
    if(event is AppStarted){
      final bool hasToken=await userRepository.hasToken();
      if(hasToken){
        yield AuthenticationAuthenticated();
      }else{
        yield AuthenticationUnauthenticated();
      }
    }

    if(event is LoggedIn){
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if(event is LoggedOut){
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }

}