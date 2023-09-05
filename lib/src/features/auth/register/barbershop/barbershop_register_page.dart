import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/hours_painel.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/weekdays_panel.dart';
import 'package:flutter/material.dart';

class BarbershopRegisterPage extends StatelessWidget {
  const BarbershopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Widget separete = SizedBox(height: screenSize.height * 0.024);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimento'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 19,
                ),
                TextFormField(
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                      label: Text('nome'),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Nome',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
                separete,
                TextFormField(
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    label: Text('nome2'),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: 'nome2',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
                separete,
                const WeekdaysPainel(),
                separete,
                const HoursPainel(
                  startTime: 8,
                  endTime: 20,
                ),
                separete,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(screenSize.height * 0.07),
                  ),
                  onPressed: () {
                    // switch (formKey.currentState?.validate()) {
                    //   case (false || null):
                    //     Messages.showError(
                    //         'Campos inválidos', context);
                    //   case true:
                    //     // login(emailEC.text, passwordEC.text);
                    // }
                  },
                  child: const Text(
                    'Cadastrar estabeleciemento',
                  ),
                )
              ],
            ),
          )),
    );
  }
}
