import 'package:carros_app_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:carros_app_flutter/pages/login/login_api.dart';
import 'package:carros_app_flutter/widgets/app_button.dart';
import 'package:carros_app_flutter/widgets/app_text.dart';

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

  final LoginApi _loginApi = LoginApi();
  bool _isLoading = false;

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
      body: Stack(
        children: [
          _body(),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppText(
              labelText: "Login",
              hintText: "Digite seu login",
              controller: _controllerLogin,
              validator: (value) => _validateField(value, isLogin: true),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next),
          AppText(
              labelText: "Password",
              hintText: "Digite seu password",
              password: true,
              controller: _controllerPassword,
              validator: (value) => _validateField(value, isLogin: false),
              keyboardType: TextInputType.emailAddress,
              focusNode: _focusSenha),
          SizedBox(
            height: 24,
          ),
          AppButton(text: "Login", onPressed: _onClickLogin)
        ],
      ),
    );
  }

  _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();

    if (formOk == true) {
      setState(() {
        _isLoading = true;
      });

      String login = _controllerLogin.text;
      String password = _controllerPassword.text;

      String message = await _loginApi.postData(login, password);

      setState(() {
        _isLoading = false;
      });

      if (message == "Deu certo!") {
        print("Maria passei aqui");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print(message);
      }
    }
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
