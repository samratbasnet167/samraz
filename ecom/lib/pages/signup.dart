import 'package:ecom/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmpasswordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confirmpasswordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Padding(
                padding: EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 0.0),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Enter full name",
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.black),
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Enter email",
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.black),
                        icon: Icon(
                          Icons.alternate_email,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.5),
                  child: TextField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red.shade700,
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        firebaseAuth
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((currentUser) => Firestore.instance
                                    .collection("users")
                                    .document(currentUser.user.uid)
                                    .setData({
                                  "uid": currentUser.user.uid,
                                  "name": _nameController.text,
                                  "email": _emailController.text,
                                  
                                }
                                )
                                )
                            .then(
                              (value) => {
                                Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },
                                  )),
                                ),
                              },
                            );
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
