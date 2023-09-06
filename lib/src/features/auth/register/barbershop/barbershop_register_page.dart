import 'package:dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw_barbershop/src/core/ui/helpers/messages.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/barbershop_register_state.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/barbershop_register_vm.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/hours_painel.dart';
import 'package:dw_barbershop/src/features/auth/register/barbershop/weekdays_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class BarbershopRegisterPage extends ConsumerStatefulWidget {
  const BarbershopRegisterPage({super.key});

  @override
  ConsumerState<BarbershopRegisterPage> createState() =>
      _BarbershopRegisterPageState();
}

class _BarbershopRegisterPageState
    extends ConsumerState<BarbershopRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barbershopRegisterVM =
        ref.watch(barbershopRegisterVmProvider.notifier);

    ref.listen(barbershopRegisterVmProvider, (_, state) {
      switch (state.status) {
        case BarbershopRegisterStateStatus.initial:
          break;
        case BarbershopRegisterStateStatus.error:
          Messages.showError('Erro ao resgistrar barbearia', context);
        case BarbershopRegisterStateStatus.success:
          Messages.showSuccess(
              'Estabelecimento cadastrado com sucesso', context);
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home/adm', (router) => false);
      }
    });

    Size screenSize = MediaQuery.of(context).size;

    Widget separete = SizedBox(height: screenSize.height * 0.024);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimento'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required('Campo nome obrigatório'),
                    onTapOutside: (_) => context.unfocus(),
                    decoration: const InputDecoration(
                        label: Text('Nome'),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Nome',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                  separete,
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo email obrigatório'),
                      Validatorless.email('Campo nome inválido'),
                    ]),
                    onTapOutside: (_) => context.unfocus(),
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  separete,
                  WeekdaysPainel(
                    onDayPressed: (value) {
                      barbershopRegisterVM.addOrRemoveOpenDay(value);
                    },
                  ),
                  separete,
                  HoursPainel(
                    startTime: 8,
                    endTime: 20,
                    onHourPressed: (int value) {
                      barbershopRegisterVM.addOrRemoveOpenHours(value);
                    },
                  ),
                  separete,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(screenSize.height * 0.07),
                    ),
                    onPressed: () {
                      switch (formKey.currentState?.validate()) {
                        case (false || null):
                          Messages.showError('Formulário inválidos', context);
                        case true:
                          barbershopRegisterVM.register(
                              nameEC.text, emailEC.text);
                      }
                    },
                    child: const Text(
                      'Cadastrar estabeleciemento',
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
