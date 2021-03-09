import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:move_app/di/get_it.dart' as getIt;
import 'package:move_app/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}
