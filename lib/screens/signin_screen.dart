import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';

class SigninScreen extends StatelessWidget {
  final nextSreen;

  const SigninScreen({Key key, this.nextSreen}) : super(key: key);

  static const name = 'signinScreen';

  static Route route({Map args}) {
    return MaterialPageRoute<void>(
      builder: (_) => SigninScreen(nextSreen: args['nextScreen']),
      settings: RouteSettings(name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SigninBloc>(
      create: (context) => SigninBloc(context.bloc<AuthenticationBloc>()),
      child: BlocBuilder<SigninBloc, BaseState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Signin Screen',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => context
                      .bloc<SigninBloc>()
                      .add(UpdateEvent(data: nextSreen)),
                  child: Text('Signin and continue to next page'),
                  color: Colors.blue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
