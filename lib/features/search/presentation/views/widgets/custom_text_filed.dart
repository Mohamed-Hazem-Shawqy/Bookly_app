import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white,
          ),
          hintText: "Search",
          enabledBorder: buildOutLineBorder(),
          focusedBorder: buildOutLineBorder()),
    );
  }

  OutlineInputBorder buildOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 45, 15, 142),
      ),
    );
  }
}
