import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurencyInputText extends StatelessWidget {
  final String hintText;
  final String prefix;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CurencyInputText({
    Key? key,
    required this.hintText,
    required this.prefix,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.left,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        decoration: InputDecoration(
          labelText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          prefix: Text(prefix),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
