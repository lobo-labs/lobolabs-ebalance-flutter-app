import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobolabs_ebalance_flutter_app/core/shared-data.dart';
import 'package:lobolabs_ebalance_flutter_app/data/models/response/sign_in_response.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/home/HomePage.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_cubit.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/pages/sign_in/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
    SharedData data = SharedData();
    var isAuthorized = data.hasToken();
    isAuthorized
        .then((value) => {
              if (value)
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HomePage(isAdmin: (true))))
                }
            })
        .onError((error, stackTrace) => data.clear());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignInCubit>();

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        body: switch (cubit.state) {
      OnSignInForm() => signInForm(cubit, colorScheme),
      OnSignInLoading() => const Center(child: CircularProgressIndicator()),
      OnSignInSuccess(response: SignInResponse response) => const Center(
          child: Text(
            'Sucesso!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      OnSignInError(error: String error) => const Center(
          child: Text(
            "Erro!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
    });
  }

  Widget signInForm(SignInCubit cubit, ColorScheme colorScheme) {

    String email = '';
    String password = '';

    void setEmail(String typedEmail) {
      setState(() {
        email = typedEmail;
      });
    }

    void setPassword(String typedPassword) {
      setState(() {
        password = typedPassword;
      });
    }

    return Container(
      color: colorScheme.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 0),
              decoration: BoxDecoration(
                color: colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                border: Border.all(color: colorScheme.shadow, width: 1.0),
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text(
                'Olá!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text(
                'Bem vindo de volta ao E-Balance',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                //controller: _textEditingController,
                onChanged: (text) {
                  setEmail(text);
                },
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: colorScheme.surface,
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                obscuringCharacter: '*',
                obscureText: true,
                //controller: _textEditingController,
                onChanged: (text) {
                  setPassword(text);
                },
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: colorScheme.surface,
                  hintText: 'Senha',
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return 'A senha deve conter pelo menos 8 caracteres';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20)),
                onPressed: () {
                  cubit.doLogin(email, password);
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(
                      fontSize: 18,
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  side: BorderSide(width: 1.0, color: colorScheme.secondary),
                  backgroundColor: colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                      fontSize: 18,
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                      color: colorScheme.tertiary, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePage(isAdmin: true)));
  }
}
