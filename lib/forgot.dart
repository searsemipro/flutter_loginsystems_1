import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MyForgotPassword extends StatefulWidget {
  const MyForgotPassword({Key? key}) : super(key: key);

  @override
  _MyForgotPasswordState createState() => _MyForgotPasswordState();
}

class _MyForgotPasswordState extends State<MyForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/forgot.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
        ),
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Reset\nYour password',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      0.35, // Adjusted padding to move fields up
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Current Password Field
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณากรอกข้อมูลให้ถูกต้อง"),
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Current password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            // New Password Field
                            TextFormField(
                              controller: _newPasswordController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "กรุณากรอกข้อมูลให้ถูกต้อง"),
                                MinLengthValidator(6,
                                    errorText:
                                        "รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัว")
                              ]),
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "New password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Confirm Password Field
                            TextFormField(
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "กรุณากรอกข้อมูลให้ถูกต้อง";
                                }
                                if (value != _newPasswordController.text) {
                                  return "รหัสผ่านยืนยันไม่ตรงกับรหัสผ่านใหม่";
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Confirm password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),

                            // Confirm Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 65, 65),
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
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Proceed with reset password logic
                                      }
                                    },
                                    icon: Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
