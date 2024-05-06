import 'package:flutter/material.dart';

class ChatShared extends StatelessWidget {
  final ValueChanged<String> onValue;
  const ChatShared({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              if (textValue.trim() != '') {
                textController.clear();
                onValue(textValue);
              }
            },
            icon: const Icon(Icons.send_outlined)),
        hintText: 'El que escribe es burro',
      ),
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        focusNode.requestFocus();
        if (value.trim() != '') {
          textController.clear();
          onValue(value);
        }
      },
    );
  }
}
