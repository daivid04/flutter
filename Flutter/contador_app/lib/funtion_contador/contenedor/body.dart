import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, bool> ask = {
    '¿Flutter es un framework \nde desarrollo móvil?': true,
    '¿Dart es el lenguaje de \nprogramación principal en Flutter?': true,
    '¿Dart es un lenguaje \nfuertemente tipado?': true,
    '¿Widgets son los bloques de \nconstrucción básicos en Flutter?': true,
    '¿Flutter es desarrollado por\n Google?': true,
    '¿Dart tiene recolección de basura?': true,
    '¿El hot reload es una \ncaracterística clave de Flutter?': true,
    '¿Flutter se utiliza solo \npara el desarrollo móvil?': false,
    '¿Dart es un lenguaje \ninterpretado?': false,
    '¿Flutter se basa en el \nlenguaje de programación Java?': false,
  };
  int i = 0;
  int cant = 0;
  bool refresh = false;
  IconData heart = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Header'),
          backgroundColor: const Color.fromARGB(255, 255, 206, 156),
          actions: [
            IconButton(
                onPressed: () {
                  i = 0;
                  cant = 0;
                  setState(() {});
                },
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                (ask.length > i)
                    ? ask.keys.toList()[i]
                    : 'Tienes $cant correctas de ${ask.length}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 200, 150, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonVerify(
                    icon: Icons.done,
                    onPressed: () {
                      setState(() {
                        if (ask.length <= i) {
                          return;
                        }
                        if (ask.values.toList()[i] == true &&
                            ask.length > i) {
                          cant++;
                        }
                        i++;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonVerify(
                    icon: Icons.clear,
                    onPressed: () {
                      setState(() {
                        if (ask.length <= i) return;
                        if (ask.values.toList()[i] == false &&
                            ask.length > i) {
                          cant++;
                        }
                        i++;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonVerify(
              icon: heart,
              onPressed: () {
                setState(() {
                  heart = heart == Icons.favorite
                      ? Icons.favorite_border
                      : Icons.favorite;
                });
              },
            )
          ],
        ));
  }
}

class ButtonVerify extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const ButtonVerify({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: const Color.fromARGB(248, 235, 145, 245),
          size: 25,
          shadows: const [
            Shadow(
              blurRadius: 5,
              color: Color.fromARGB(59, 255, 255, 255),
            ),

            // backgroundColor: Color.fromARGB(255, 2, 2, 255),
          ],
        ));
  }
}
