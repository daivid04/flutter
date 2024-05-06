import 'package:flutter/material.dart';

class CounterFunctionScreens extends StatefulWidget {
  const CounterFunctionScreens({super.key});

  @override
  State<CounterFunctionScreens> createState() => _CounterFunctionScreensState();
}

class _CounterFunctionScreensState extends State<CounterFunctionScreens> {
  int clicks = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( //Es para el header
          centerTitle: true,
          title: const Text('Counter Functions'),
          actions: [ //Para añadir varios widget
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => setState(() {
                clicks = 0;
              }),
            ),
          ],
        ),
        body: Center( //Para poder centrar por los costados
          child: Column( //Column tiene varios hijos
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                clicks.toString(),
                style: const TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(200, 100, 50, 200)),
              ),
              Text(
                'click${clicks == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        floatingActionButton: Column( //Es para agregar varios widgets, mayormente usado para botones
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clicks++;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              icon: Icons.exposure_minus_1,
              onPressed: () => setState(() {
                if (clicks == 0) return;
                clicks--;
              }),
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(), bordes
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
