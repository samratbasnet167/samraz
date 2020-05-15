import 'package:flutter/material.dart';
import 'package:ecom/utils/firebase_auth.dart';
import 'package:ecom/pages/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() { 
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white
      ,
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              
              Padding(
                padding:EdgeInsets.fromLTRB(130.0, 0.0, 0.0, 0.0),
                child: Text("LOGIN",style: TextStyle(
                 
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black,
                  
                  
                ),
                
                ),
              ),

             SizedBox(
               height:20.0
             ),

             
              
            Padding(padding: EdgeInsets.all(5.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white.withOpacity(0.5),
               child: TextField(
                
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                  
                  icon: Icon(Icons.alternate_email,color: Colors.black,)
                ),
              ),
            ),
            ),
              
              const SizedBox(height: 10.0),
               Padding(padding: EdgeInsets.all(5.0),
              child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white.withOpacity(0.5),
             child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                  icon: Icon(Icons.lock_outline, color: Colors.black,),
                ),
              ),
              ),
               ),
              const SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                child: Text("Login", style: TextStyle(color: Colors.white),),
                onPressed: ()async {
                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    print("Email and password cannot be empty");
                    return;
                  }
                  bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                  if(!res) {
                    print("Login failed");
                  }
                },
              ),



               Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context){
                                         return Signup();
                                    }));
                                    },
                                    child: Text(
                                      "Create an account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black),
                                    ))),
                          ],
                        ),
                const SizedBox(height: 30.0),
              MaterialButton(
                minWidth: 500.0,
                color: Colors.red,
                child: Text("Login with Google", style: TextStyle(color:Colors.white),),
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("error logging in with google");
                },
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}