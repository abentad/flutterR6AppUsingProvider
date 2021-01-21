import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterApiWithProvider/controllers/login_provider.dart';
import 'package:flutterApiWithProvider/services/google_login_service.dart';
import 'package:flutterApiWithProvider/views/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);

    void _navigateToHomeScreen() {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) => Home()));
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello There \nWelcome Back.",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            MaterialButton(
              onPressed: () async {
                //Todo: implement google sign in
                var _user = await signInWithGoogle();
                provider.setEmail(_user.email.toString());
                provider.setName(_user.displayName.toString());
                provider.setProfileImageUrl(_user.photoURL.toString());
                _navigateToHomeScreen();
              },
              height: 50.0,
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.teal,
                ),
              ),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Log In With Google',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
