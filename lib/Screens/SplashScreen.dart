import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_sample/Core/Extensions.dart';
import 'package:flutter_web_sample/Core/HttpBase.dart';
import 'package:flutter_web_sample/Core/SharedManager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/forTaksi.png'),
              height: context.w(30),
              width: context.w(30),
            ),
            Image(
              image: AssetImage('assets/forTaksiText.png'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _readToken();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  FutureOr checkStat(value) {}

  Future _readToken() async {
    var value = SharedManager.instance.getString(SharedKey.TOKEN.toString());
    print(Uri.base);

    if (value != null) {
      HttpBase.instance.setAuthToken(value);
      if (Uri.base.path != '' || Uri.base.path != '/')
        Navigator.pushReplacementNamed(context, '/' + Uri.base.path.split('/').last);
      else
        Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
