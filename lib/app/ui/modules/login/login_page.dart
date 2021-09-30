import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_triple_poc/app/ui/components/primary_button.dart';
import 'package:flutter_triple_poc/app/ui/components/snackbar.dart';
import 'package:flutter_triple_poc/app/ui/components/spinner.dart';
import 'package:flutter_triple_poc/app/ui/components/text_box.dart';

import '../../theme.dart';
import 'login_store.dart';
import 'login_validator.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginValidator {
  final LoginStore store = Modular.get();
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    store.observer(onError: (e) {
      asuka.showSnackBar(snackBar(
        message: "Deu ruim!",
        type: TypeMessage.FAIL,
      ));
    }, onState: (state) {
      if (state) {
        asuka.showSnackBar(snackBar(
          message: "Deu bom!",
          type: TypeMessage.FAIL,
        ));
        Future.delayed(const Duration(seconds: 2), () => Modular.to.pushReplacementNamed('/'));
      }
    });
  }

  Future<void> signIn() async {
    FocusScope.of(context).requestFocus(new FocusNode());

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      store.signInWithEmail(emailController.text, senhaController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Image.asset("assets/images/logo.png", height: 146),
              SizedBox(height: 32.0),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      TextBox(
                        controller: emailController,
                        label: "E-mail",
                        validator: (value) => validateEmail(value!, context),
                      ),
                      TextBox(
                        controller: senhaController,
                        label: "Senha",
                        validator: (value) => validatePassword(value!, context),
                        obscureText: true,
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (value) => this.signIn(),
                      ),
                      SizedBox(height: 32),
                      TripleBuilder<LoginStore, Exception, bool>(
                        store: store,
                        builder: (_, triple) {
                          return AnimatedCrossFade(
                            firstChild: PrimaryButton(
                              text: "Entrar",
                              press: this.signIn,
                            ),
                            secondChild: Spinner(),
                            duration: Duration(milliseconds: 500),
                            crossFadeState: triple.isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     reverse: true,
    //     padding: const EdgeInsets.all(32),
    //     child: Column(
    //       children: [
    //         Spacer(flex: 2),
    //         Image.asset("assets/images/logo.png", height: 146),
    //         Text("Running Hit"),
    //         Text(
    //           "Admin",
    //           textAlign: TextAlign.right,
    //         ),
    //         Spacer(),
    //         Form(
    //           key: _formKey,
    //           child: Padding(
    //             padding: const EdgeInsets.all(32.0),
    //             child: Column(
    //               children: <Widget>[
    //                 TextBox(
    //                   controller: emailController,
    //                   label: "E-mail",
    //                   validator: (value) => validateEmail(value!, context),
    //                 ),
    //                 TextBox(
    //                   controller: senhaController,
    //                   label: "Senha",
    //                   validator: (value) => validatePassword(value!, context),
    //                   obscureText: true,
    //                   textInputAction: TextInputAction.go,
    //                   onFieldSubmitted: (value) => this.signIn(),
    //                 ),
    //                 SizedBox(height: 32),
    //                 ScopedBuilder(
    //                   store: store,
    //                   onState: (_, state) => PrimaryButton(
    //                     text: "Entrar",
    //                     press: this.signIn,
    //                   ),
    //                   onLoading: (_) => Spinner(),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Spacer(flex: 2),
    //       ],
    //     ),
    //   ),
    // );
  }
}
