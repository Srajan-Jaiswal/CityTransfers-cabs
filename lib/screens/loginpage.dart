import 'package:citytransfers_cabs/screens/registrationpage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:citytransfers_cabs/widgets/widgets.dart';

class LoginPage extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  void showSnackBar(String title)
  {
    final  snackbar = SnackBar(
     content: Text( title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
);
scaffoldKey.currentState.showSnackBar(snackbar);
  } 

  static const String id = 'login';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            ClipOval(
              child: Image(
                image: AssetImage('images/logo.jpg'),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Sign In as Rider',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Brand-Bold',
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        prefixIcon: const Icon(
                          Icons.security,
                          color: Colors.purpleAccent,
                        )),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              height: 50.0,
              child: RaisedButton(
                  onPressed: () async {
                    // checking network  availability
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    if (connectivityResult != ConnectivityResult.mobile &&
                        connectivityResult != ConnectivityResult.wifi) {
                      showSnackBar("No internet connection");
                      return;
                    }

                    if(!emailController.text.contains("@")){
                      showSnackBar("Email doesn't exist");
                      return;
                    }
                    if(passwordController.text.length < 8){
                      showSnackBar("wrong password");
                      return;
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(130),
                  ),
                  color: Colors.purpleAccent,
                  textColor: Colors.black,
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(fontSize: 15.5, color: Colors.black)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RegistrationPage.id, (route) => false);
                    },
                    child: Text("  Sign Up",
                        style: TextStyle(
                            fontSize: 16.5,
                            color: Colors.purple,
                            decoration: TextDecoration.underline)))
              ],
            ),
          ],
        )));
  }
}
