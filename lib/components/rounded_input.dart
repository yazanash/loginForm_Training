import 'package:flutter/material.dart';

import '../constans.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget{
  const RoundedInput({
    Key key,
    @required this.icon,
    @required this.hint,
  }):super(key : key);
  final String hint;
  final IconData icon;
  @override
  Widget build(BuildContext context){
    return  InputContainer(child:TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          icon: Icon(icon,color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
      ),
    ),
    );
  }
}

