import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterApiWithProvider/controllers/info_provider.dart';
import 'package:flutterApiWithProvider/views/info.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          builder: (context) => ChangeNotifierProvider(
            create: (context) => InfoProvider(),
            child: Info(_playerNameController.text),
          ),
        ),
      );
    } else {
      print('not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('r6 with provider'),
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
