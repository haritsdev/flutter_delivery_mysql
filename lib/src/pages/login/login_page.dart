import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column(
            // POSICIONAR ELEMENTOS UNO DEBAJO DEL OTRO (VERTICAL)
            children: [_imageCover(), _textAppName()],
          ),
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.amber,
    );
  }

  Widget _textAppName() {
    return const Text(
      'DELIVERY MYSQL',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.35, left: 50, right: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email', prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password', prefixIcon: Icon(Icons.lock)),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => con.login(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            'LOGIN',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 45),
      child: const Text(
        'Form Login User',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      // UBICAR ELEMENTOS UNO AL LADO DEL OTRO (HORIZONTAL)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Belum Punya akun?',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: const Text(
            'Register disini',
            style: TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }

  // PRIVADO
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/delivery.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}
