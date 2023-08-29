import 'package:dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget separete = SizedBox(height: screenSize.height * 0.03);

    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.backgroudChair),
              opacity: 0.3,
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageConstants.imageLogo),
                        separete,
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            hintText: 'E-mail',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                        separete,
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Senha'),
                            hintText: 'Senha',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                        separete,
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Esqueceu a senha',
                            style: TextStyle(
                              color: ColorsConstants.brow,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        separete,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(screenSize.height * 0.07),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'ACESSAR',
                          ),
                        )
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Criar conta',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
