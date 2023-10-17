import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_bloc.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (BuildContext context) => SignInBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const SignInPage(),
        ));
  }

  ThemeData getLightTheme() {
    return ThemeData(
        fontFamily: 'poppings',
        colorScheme: const ColorScheme.light(
            brightness: Brightness.light,
            primary: Color(0xFF111828),
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF0A6375),
            background: Color(0xFFF9FAFC),
            surface: Color(0xFFFFFFFF),
            tertiary: Color(0xFF999999),
            shadow: Color(0xFFF9FAFC)),
        textTheme: const TextTheme(
            titleMedium: TextStyle(color: Color(0xfff7fbfc)),
            titleSmall: TextStyle(color: Color(0xFF3e4555))));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        fontFamily: 'poppings',
        colorScheme: const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Color(0xFFFFFFFF),
            onPrimary: Color(0xFF111828),
            secondary: Color(0xFF0A6375),
            background: Color(0xFF111828),
            surface: Color(0xFF1D2733),
            tertiary: Color(0xFF999999),
            shadow: Color(0xFF1E2535)),
        textTheme: const TextTheme(
            titleMedium: TextStyle(color: Color(0xfff7fbfc)),
            titleSmall: TextStyle(color: Color(0xFF3e4555))));
  }
}
