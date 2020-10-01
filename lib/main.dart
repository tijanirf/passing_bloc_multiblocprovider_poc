import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'blocs/blocs.dart';

void main() {
  Bloc.observer = MainBlocObserver();

  runApp(App());
}
