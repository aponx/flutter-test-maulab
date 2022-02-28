import 'package:ajobthing/utils/utils.dart';
import 'package:ajobthing/view/home.dart';
import 'package:ajobthing/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'utils/default_app_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AJobThing',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.yellow,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
