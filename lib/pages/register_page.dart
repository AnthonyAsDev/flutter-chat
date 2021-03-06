import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/button_blue.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Logo(titulo: "Register"),
                  _Form(),
                  const Labels(
                    ruta: "login",
                    titulo: "¿Ya tienes una cuenta?",
                    subTitulo: "Ingresa ahora!",
                  ),
                  const Text(
                    "Términos y condiciones de uso",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: "Nombre",
            keyboardType: TextInputType.emailAddress,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: "Correo",
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: "Password",
            textController: passCtrl,
            isPassword: true,
          ),
          ButtonBlue(
            text: "Crear Cuenta",
            onPressed: authService.autenticando
                ? null
                : () async {
                    final registroOk = await authService.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text.trim());

                    if (registroOk == true) {
                      Navigator.pushReplacementNamed(context, "users");
                    } else {
                      mostrarAlerta(context, "Registro incorrecto", registroOk);
                    }
                  },
          ),
        ],
      ),
    );
  }
}
