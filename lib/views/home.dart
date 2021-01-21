import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterApiWithProvider/controllers/login_provider.dart';
import 'package:flutterApiWithProvider/services/google_login_service.dart';
import 'package:flutterApiWithProvider/views/login.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _playerNameController = TextEditingController();

  void validaateAndPush() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    if (_formKey.currentState.validate()) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => Info(_playerNameController.text),
        ),
      );
    } else {
      print('not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<LoginProvider>(context);

    void _navigateToLoginScreen() async {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Text('Log out Success'),
          backgroundColor: Colors.green,
        ),
      );
      //shows the snack bar for 2 seconds before navigating to the login page
      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) => Login()));
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4))),
              ),
              height: 200.0,
              child: Consumer<LoginProvider>(
                builder: (_, provider, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(provider.imgUrl),
                        radius: 30.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(provider.name),
                    ],
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Consumer<LoginProvider>(
          builder: (_, provider, __) {
            return Text(provider.name);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              signOutGoogle();
              _navigateToLoginScreen();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _playerNameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Required";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Player Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () => validaateAndPush(),
                child: Text('Search', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                minWidth: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
