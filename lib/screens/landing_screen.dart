import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passing_bloc_multiblocprovider_poc/blocs/blocs.dart';
import 'package:passing_bloc_multiblocprovider_poc/screens/screens.dart';

class LandingScreen extends StatelessWidget {
  final String mode;

  const LandingScreen({Key key, this.mode}) : super(key: key);

  static const name = 'landingScreen';

  static Route route({Map args}) {
    return MaterialPageRoute<void>(
      builder: (_) => LandingScreen(
        mode: args['mode'],
      ),
      settings: RouteSettings(name: name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, BaseState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Landing Screen: $mode',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                RaisedButton(
                  onPressed: () => context.bloc<LandingBloc>().add(
                        UpdateEvent(
                          data: {
                            'ctx': context,
                            'authState':
                                context.bloc<AuthenticationBloc>().state,
                            'next': ProfileScreen.route(),
                          },
                        ),
                      ),
                  child: Text('Profile Screen (need signin)'),
                  color: Colors.blue,
                ),
                RaisedButton(
                  onPressed: () => context.bloc<LandingBloc>().add(
                        UpdateEvent(
                          data: {
                            'ctx': context,
                            'authState':
                                context.bloc<AuthenticationBloc>().state,
                            'next': ListingScreen.route(),
                          },
                        ),
                      ),
                  child: Text('Listing Screen'),
                  color: Colors.red,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
