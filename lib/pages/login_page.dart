import 'package:carros_app_flutter/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerLogin = TextEditingController();

  final _controllerPassword = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _text(
            "Login",
            "Digite seu login",
            controller: _controllerLogin,
            validator: (value) => _validateField(value, isLogin: true),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          _text(
            "Password",
            "Digite seu password",
            password: true,
            controller: _controllerPassword,
            validator: (value) => _validateField(value, isLogin: false),
            keyboardType: TextInputType.number,
            focusNode: _focusSenha,
          ),
          SizedBox(
            height: 24,
          ),
          AppButton(text: "teste", onPressed: _onClickLogin)
        ],
      ),
    );
  }

  _text(
    String labelText,
    String hintText, {
    bool password = false,
    controller,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: password,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
      FocusScope.of(context).requestFocus(_focusSenha);
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: UnderlineInputBorder(),
      ),
    );
  }

  _onClickLogin() {
    bool? formOk = _formKey.currentState?.validate();

    String login = _controllerLogin.text;
    String password = _controllerPassword.text;

    print("Login: $login, password: $password");
  }

  String? _validateField(String? value, {required bool isLogin}) {
    if (value == null || value.isEmpty) {
      if (isLogin == true) {
        return "Digite o login";
      } else {
        if (value!.length < 3) {
          return "A senha precisa ter pelo menos 3 números";
        }
      }
    }

    return null;
  }
}
