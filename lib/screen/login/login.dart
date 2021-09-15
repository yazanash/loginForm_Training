import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/components/password_input.dart';
import 'package:login_app/components/rounded_button.dart';
import 'package:login_app/components/rounded_input.dart';

import '../../constans.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  bool isLogin=true;
  Animation<double> ContainerSize;
  AnimationController animationController;
  Duration animatedDuration=Duration(milliseconds: 270);

  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    animationController =AnimationController(vsync: this,duration: animatedDuration);
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize =size.height - (size.height*0.2);
    double defaultRegesterSize =size.height - (size.height*0.1);

    ContainerSize=Tween<double>(begin: size.height*0.1,end: defaultRegesterSize).animate(CurvedAnimation(parent: animationController,curve: Curves.linear));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(

        children: [
          Positioned(
              top: 100,
              right: -50,
              child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kPrimaryColor
            ),
          )
          ),
          Positioned(
              top:-50,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kPrimaryColor
                ),
              )
          ),
          //Cancel button
          AnimatedOpacity(
            opacity: isLogin?0.0:1.0,
            duration: animatedDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height*0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: isLogin?null: (){
                    animationController.reverse();
                    setState(() {
                      isLogin=!isLogin;
                    });
                  },
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          //Login page
          AnimatedOpacity(
            opacity: isLogin?1.0:0.0,
            duration: animatedDuration*4,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                 // color: Colors.white,
                  height: defaultLoginSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                    'Welcome To DonaSoft',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: kPrimaryColor

                      ),

                      ),
                      SizedBox(height: 40,),
                      Image(image: AssetImage('assets/images/logo2.jpg'),width: 300 ,height: 300,),
                      SizedBox(height: 10,),
                      RoundedInput(icon: Icons.email,hint: 'Username',),
                      RoundedPasInput(hint:'password'),
                      Roundedbutton(title:'Login')
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Register page
          AnimatedBuilder(
            animation: animationController,
            builder: (context,child){
              if(viewInset==0&&isLogin){
                return BuildRegisterContainer();
              }
              else if(!isLogin){
                return BuildRegisterContainer();
              }
              return Container();
            },

          ),
        AnimatedOpacity(
          opacity: isLogin?0.0:1.0,
          duration: animatedDuration *5,
          child: Visibility(
            visible: !isLogin,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  color: Colors.white,
                  height: defaultLoginSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To DonaSoft',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: kPrimaryColor

                        ),
                      ),
                      SizedBox(height: 40,),
                      Image(image: AssetImage('assets/images/logo2.jpg'),width: 250 ,height: 250,),
                      SizedBox(height: 10,),
                      RoundedInput(icon: Icons.email,hint: 'Username',),
                      RoundedInput(icon: Icons.face_rounded,hint: 'Name',),
                      RoundedPasInput(hint:'password'),
                      Roundedbutton(title:'Sign up')
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
  Widget BuildRegisterContainer(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          height: ContainerSize.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child:GestureDetector(
            onTap: !isLogin ?null: () {
              animationController.forward();
              setState(() {
                isLogin=!isLogin;
              });
            },
            child: isLogin? Text(
              "Don't have an account? Sign up",
              style: TextStyle(
                color: kB,
                fontSize: 18,
              ),
            ):null,
          )
      ),
    );
  }
}

