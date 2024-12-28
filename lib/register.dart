import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ใส่พื้นหลังเป็นภาพสำหรับหน้าลงทะเบียน
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // ทำให้พื้นหลังของ Scaffold โปร่งใส
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // ทำให้พื้นหลังของ AppBar โปร่งใส
          elevation: 0, // เอาเงาออกจาก AppBar
        ),
        body: Stack(
          children: [
            // ข้อความหัวเรื่อง "Create Account" บนพื้นหลัง
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            // ใช้ SingleChildScrollView เพื่อให้หน้าฟอร์มสามารถเลื่อนขึ้นลงได้
            SingleChildScrollView(
              child: Container(
                // คำนวณระยะการเลื่อนของฟอร์มตามขนาดของหน้าจอ
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ส่วนนี้ใช้สำหรับฟอร์มการกรอกข้อมูล
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          // ฟิลด์สำหรับกรอกชื่อ (Name)
                          TextField(
                            style: TextStyle(
                                color: Colors.white), // สีฟอนต์ขณะกรอก
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors
                                      .white, // สีของเส้นขอบขณะยังไม่โฟกัส
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black, // สีของเส้นขอบขณะโฟกัส
                                ),
                              ),
                              hintText: "Name", // คำใบ้ในฟิลด์
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30, // ระยะห่างระหว่างฟิลด์
                          ),
                          // ฟิลด์สำหรับกรอกอีเมล (Email)
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // ฟิลด์สำหรับกรอกรหัสผ่าน (Password) และทำให้รหัสแสดงเป็นจุด
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true, // ทำให้ข้อความรหัสผ่านเป็นจุด
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40, // ระยะห่างก่อนปุ่มสมัคร
                          ),
                          // ส่วนปุ่มสมัคร (Sign Up)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed:
                                        () {}, // ใส่ฟังก์ชันสำหรับการสมัคร
                                    icon: Icon(
                                      Icons
                                          .arrow_forward, // ไอคอนลูกศรไปข้างหน้า
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40, // ระยะห่างก่อนลิงก์เข้าสู่ระบบ
                          ),
                          // ลิงก์เพื่อไปยังหน้าล็อกอิน (Sign In)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // เปลี่ยนไปหน้าล็อกอิน
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
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
