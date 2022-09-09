import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_game/views/menu_view.dart';
import 'package:flutter/material.dart';

import '../user.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/signInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _nickname = '';
  TextEditingController nickName = TextEditingController();
  final _dataNicknames = FirebaseFirestore.instance;
  UserData userData = UserData();

  @override
  void initState() {
    super.initState();
    readyForScreen();
  }

  void readyForScreen() async {
    _nickname = userData.getNickname('nickname');
    setState(() {});
  }

  void saveNickname(String nickname) {
    userData.saveNickname('nickname', nickname);
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "This nickname is already in use.\n Please try another nickname.",
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }

  bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    var nicknameRef = _dataNicknames.collection('Scores');
    if (_nickname == '') {
      return Scaffold(
          body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: nicknameRef.snapshots(),
                    builder: (context, AsyncSnapshot asyncSnapshot) {
                      if (asyncSnapshot.hasError) {
                        return const Center(
                          child: Text("Please check your internet connection."),
                        );
                      } else {
                        if (asyncSnapshot.hasData) {
                          List<DocumentSnapshot> listOfDocumentSnap =
                              asyncSnapshot.data.docs;
                          return Column(
                            children: [
                              TextFormField(
                                obscureText: false,
                                controller: nickName,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Nickname",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.brown[300],
                                child: MaterialButton(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  onPressed: () {
                                    int k = 0;
                                    for (int i = 0;
                                        i < listOfDocumentSnap.length;
                                        i++) {
                                      if (equalsIgnoreCase(nickName.text,
                                          listOfDocumentSnap[i].get('name'))) {
                                        k = k + 1;
                                      }
                                    }
                                    if (k == 1) {
                                      return _showDialog();
                                    } else {
                                      saveNickname(nickName.text);
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Menu()));
                                    }
                                  },
                                  child: const Text(
                                    "Log in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    })
              ]),
        ),
      ));
    } else {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Menu()));
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
