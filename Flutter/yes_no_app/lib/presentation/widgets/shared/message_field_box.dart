import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>
      onValue; //Es un callback el cual pide como parámetro <String> y que va a retornar una variable del tipo que querramos

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //Creamos una instancia final de cada tipo de que necesitamos para que no se cree una instancia cada vez que se use el widget
    final textController =
        TextEditingController(); //Para tener el control de una caja de formulario

    final outlinedInputBorder = UnderlineInputBorder(
        //Diseño del borde de las contenedores
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final focusNode = FocusNode(); //Creas una variable focus
    final inputDecoration = InputDecoration(
      //Datos para darle diseño al input
      hintText: 'Burro tu mensaje debe terminar con "?"', //Es parecido al placeHolder de html
      filled: true,
      enabledBorder: outlinedInputBorder,
      focusedBorder: outlinedInputBorder,
      suffixIcon: IconButton(
          onPressed: () {
            final textValue =
                textController.value.text; //Le pedimos el valor del texto
            // print(textValue);
            if (textValue.trim() != '') {
              textController.clear();
              onValue(textValue); //Llamamos al callback usando el textValue como parámetro
            }
          },
          icon: const Icon(
            Icons.send_outlined,
          )),
    );


    return TextFormField(
      
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode, //Para decir que valor va a tener el focus
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //Guarda cuando presiono enter
        focusNode.requestFocus(); //Es para decir que necesita focus
        if (value.trim() != '') {
          textController.clear();
          onValue(value);
        }
      },
      // onChanged: (value) {
      //   //Guarda cada vez que escribes una tecla
      //   print(value);
      // },
    );
  }
}
