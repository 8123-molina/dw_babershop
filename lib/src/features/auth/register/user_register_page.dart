import 'package:flutter/material.dart';

class UserRegisterPage extends StatelessWidget {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget separator = SizedBox(height: screenSize.height * 0.024);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.03),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              separator,
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              separator,
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              separator,
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Confirmar Senha'),
                ),
              ),
              separator,
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(56)),
                  child: const Text('Criar Conta'))
            ],
          ),
        ),
      ),
    );
  }
}
