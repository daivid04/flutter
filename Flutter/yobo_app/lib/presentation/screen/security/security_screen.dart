import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobo_app/presentation/provider/provider_user_data.dart';
import 'package:yobo_app/presentation/widgets/shared/navigation_bar.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});
  static const String name = 'Security_Screen';
  @override
  Widget build(BuildContext context) {
    final sizeVertical = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: sizeVertical * 0.1),
        child: Column(
          children: [
            Image.asset('assets/img/logo.png'),
            const SizedBox(
              height: 50,
            ),
            const FormScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const ButtonNavigationBar(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({
    super.key,
  });

  @override
  State<FormScreen> createState() => _FormState();
}

class _FormState extends State<FormScreen> {
  String correo = '';
  String contra = '';
  String user = '';
  final focusPassword = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Key keyCorreo = const Key('correo');
  @override
  Widget build(BuildContext context) {
    final providerUserData = context.watch<ProviderUserData>();
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
          child: Column(
            children: [
              TextFormField(
                key: keyCorreo,
                decoration: const InputDecoration(
                  labelText: "Correo o usuario",
                ),
                validator: (value) {
                  // if (value!.isEmpty == true || value.contains('@') == false) {
                  //   return 'Por favor ingrese su correo';
                  // }

                  if (value == '') {
                    return 'Ingrese su correo o nombre de usuario';
                  }
                  if (providerUserData.verify(user) == 'ga') {
                    return 'No se encuentra';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  correo = newValue!;
                },
                onFieldSubmitted: (_) {
                  // FocusScope.of(context).requestFocus(); Si no tienes un referencia
                  focusPassword.requestFocus();
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                obscureText: true,
                focusNode: focusPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        // TODO: visualizar contraseña
                      },
                      icon: const Icon(
                        Icons.visibility,
                        size: 25,
                      )),
                  labelText: "Contraseña",
                ),
                validator: (value) {
                  if (value!.isEmpty == true) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  contra = newValue!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              IconAccount(
                onTap: () {
                  if (_formKey.currentState!.validate() == true) {
                    _formKey.currentState!.save();
                  }
                },
              ),
            ],
          ),
        ));
  }
}

class IconAccount extends StatelessWidget {
  const IconAccount({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: colors.primary.withOpacity(0.69),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Iniciar Sección',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
