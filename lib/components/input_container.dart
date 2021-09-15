
import 'package:flutter/material.dart';

import '../constans.dart';

class InputContainer extends StatelessWidget{
  const InputContainer({
    Key key,
    @required this.child,
  }):super(key : key);

  final Widget child;

  @override
  Widget build(BuildContext context){
    Size size =MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColor.withAlpha(10)
      ),
      child:child,
    );
  }
}