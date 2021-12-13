import 'package:flutter/material.dart';
import 'package:flutter_web_sample/Core/Extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameC=TextEditingController();
  TextEditingController passwordC=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/forTaksiText.png'),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                ),
                child: TextFormField(
                  key: const ValueKey('userName'),
                  keyboardType: TextInputType.text,
                  // inputFormatters: [
                  //   UpperCaseTextFormatter(),
                  // ],
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    suffixStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.amberAccent[100],
                    hintText: 'Kullanıcı Adı',
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: userNameC,
                  textInputAction: TextInputAction.next,
                  // onChanged: (v){
                  //   refC.text=v.toUpperCase();
                  //   refC.selection = TextSelection.fromPosition(TextPosition(offset: refC.text.length));
                  // },
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.1,
                ),
                child: TextFormField(
                  key: const ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    suffixStyle: const TextStyle(color: Colors.black54),

                    filled: true,
                    fillColor: Colors.amberAccent[100],
                    hintText: 'Şifre',
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  controller: passwordC,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (term) {
                    setState(() {
                    });
                  },
                  validator: (value) {
                    if (value==null) {
                      return 'Şifre boş olamaz';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.amberAccent,
                    child: const Text(
                      "Giriş",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {

  }

}
