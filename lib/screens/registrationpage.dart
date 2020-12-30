import 'package:citytransfers_cabs/screens/loginpage.dart';
import 'package:citytransfers_cabs/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  static const String id = 'register';

  final FirebaseAuth _auth = FirebaseAuth.instance;

// Text controllers  for the text inputs

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  void registerUser() async {
    // ignore: deprecated_member_use
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)).user;
    if(user != null)
  {
    print('registration successfull');
  }

  }
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
              height: 20,
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
              height: 25,
            ),
            Text(
              'Create Account as Rider',
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
                    controller: fullNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Full name",
                      hintStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      prefixIcon: const Icon(
                        Icons.text_fields,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Email address",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.purpleAccent,
                        )),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      prefixIcon: const Icon(
                        Icons.phone_iphone_rounded,
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
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                  onPressed: () {

                   registerUser();

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
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(fontSize: 15.5, color: Colors.black)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.id, (route) => false);
                    },
                    child: Text("  Log in",
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
