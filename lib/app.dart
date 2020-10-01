import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(context.bloc<SigninBloc>())
            ..add(InitializeEvent()),
        ),
        BlocProvider(
          create: (context) => LandingBloc(),
        )
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, BaseState>(
          listener: (context, state) {
            if (state is AuthenticatedState) {
              _navigator.pushAndRemoveUntil(
                LandingScreen.route(args: {'mode': 'Authenticated'}),
                (route) => false,
              );
            } else if (state is GuestModeState) {
              _navigator.pushAndRemoveUntil(
                LandingScreen.route(args: {'mode': 'GuestMode'}),
                (route) => false,
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}
