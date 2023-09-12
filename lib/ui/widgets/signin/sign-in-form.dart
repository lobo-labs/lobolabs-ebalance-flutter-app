import 'package:flutter/material.dart';

Widget signInForm(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return Scaffold(
    body: Container(
      color: colorScheme.background,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          //controller: _textEditingController,
                          onChanged: (val) {
                            // setState(() {
                            //isEmailCorrect = isEmail(val);
                            // });
                          },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            filled: true,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextFormField(
                          obscuringCharacter: '*',
                          obscureText: true,
                          //controller: _textEditingController,
                          // onChanged: (val) {
                          //   setState(() {
                          //     //isEmailCorrect = isEmail(val);
                          //   });
                          // },
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            filled: true,
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: const Size.fromHeight(50),
                                backgroundColor: colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20)),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const HomePage(isAdmin: true)));
                            },
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size.fromHeight(50),
                            side: BorderSide(
                                width: 1.0, color: colorScheme.secondary),
                            backgroundColor: colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const HomePage(isAdmin: true)));
                          },
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
                                color: colorScheme.tertiary,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
