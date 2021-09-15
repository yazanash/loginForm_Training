import 'package:flutter/material.dart';

import '../constans.dart';
import 'input_container.dart';

class RoundedPasInput extends StatelessWidget{
  const RoundedPasInput({
    Key key,
    @required this.hint,
  }):super(key : key);
  final String hint;
  @override
  Widget build(BuildContext context){
    return  InputContainer(child:TextField(
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock,color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
      ),
    ),
    );
  }
}

