import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_repository.dart';
import 'package:flutter_bloc_login/authentication/authentication.dart';
import 'package:flutter_bloc_login/login/login.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(
          loginBloc: _loginBloc, authenticationBloc: _authenticationBloc),
    );
  }

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
        userRepository: _userRepository,
        authenticationBloc: _authenticationBloc);
    super.initState();
  }
}
