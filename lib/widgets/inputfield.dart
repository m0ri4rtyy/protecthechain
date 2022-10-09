import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscuretext;
  final Icon leadingicon;
  final TextEditingController? txController;

  const InputField(this.obscuretext,
      {super.key,
      required this.hint,
      required this.txController,
      required this.leadingicon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          obscureText: obscuretext,
          controller: txController,
          decoration: InputDecoration(
              icon: leadingicon,
              hintText: hint,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00000), width: 0)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00000), width: 0))),
        ),
      ),
    );
  }
}
