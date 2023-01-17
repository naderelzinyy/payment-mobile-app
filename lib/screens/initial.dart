import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/screens/login.dart';
import 'package:payment_app/screens/signup.dart';

import '../component/colors.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backGroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColor.mainColor, //background color of button
                side: const BorderSide(
                    width: 3, color: Colors.white), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ));
              },
              child: const Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          SizedBox(
            height: 60,
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColor.mainColor, //background color of button
                side: const BorderSide(
                    width: 3, color: Colors.white), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const RegisterScreen(),
                    ));
              },
              child: const Text('Register',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }
}
