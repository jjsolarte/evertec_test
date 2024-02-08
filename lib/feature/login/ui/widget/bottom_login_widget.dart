import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomLoginWidget extends StatelessWidget {
  const BottomLoginWidget({Key? key}) : super(key: key);

  void callLoginToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () => callLoginToast('Google - Evertec'),
              child: Image.asset('assets/icons/icon_google.png')),
          InkWell(
              onTap: () => callLoginToast('Twitter - Evertec'),
              child: Image.asset('assets/icons/icon_twitter.png')),
          InkWell(
              onTap: () => callLoginToast('Instagram - Evertec'),
              child: Image.asset('assets/icons/icon_insta.png')),
        ],
      ),
    );
  }
}
