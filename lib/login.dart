import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginsystems_1/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 35, top: 130),
                    child: Text(
                      'Welcome\nBack',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 33,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35, right: 35),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "กรุณากรอกอีเมล"),
                                      EmailValidator(
                                          errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                                    ]),
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: RequiredValidator(
                                        errorText: "กรุณากรอกรหัสผ่าน"),
                                    style: TextStyle(),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 65, 65),
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 65, 65),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              try {
                                                await FirebaseAuth.instance
                                                    .signInWithEmailAndPassword(
                                                  email: emailController.text
                                                      .trim(),
                                                  password:
                                                      passwordController.text,
                                                );
                                                Fluttertoast.showToast(
                                                  msg: "Login successful!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHome()),
                                                );
                                              } on FirebaseAuthException catch (e) {
                                                String errorMessage;
                                                switch (e.code) {
                                                  case 'user-not-found':
                                                    errorMessage =
                                                        "No user found for this email.";
                                                    break;
                                                  case 'wrong-password':
                                                    errorMessage =
                                                        "Incorrect password.";
                                                    break;
                                                  case 'invalid-email':
                                                    errorMessage =
                                                        "Invalid email format.";
                                                    break;
                                                  default:
                                                    errorMessage =
                                                        "An unknown error occurred.";
                                                }
                                                Fluttertoast.showToast(
                                                  msg: errorMessage,
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                              }
                                            }
                                          },
                                          icon: Icon(Icons.arrow_forward),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          20), // ระยะห่างระหว่าง Sign In และ Forgot password
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'register');
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'forgot');
                                        },
                                        child: Text(
                                          'Forgot password',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
