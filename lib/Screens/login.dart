import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryCode = TextEditingController();
  var phone="";

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/login.png', width: 150, height: 150,),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'Phone Verification',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  'We need to register your phone number before getting started !',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryCode,
                          decoration: const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                       const Text('|',
                       style: TextStyle(fontSize: 30, color: Colors.grey),
                       ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          showCursor: true,
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            phone = value;
                          },
                          decoration: const InputDecoration(border: InputBorder.none,
                          hintText: 'Phone'),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(phone.length == 10){
                        print("inside IF");
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: countryCode.text + phone,
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            MyPhone.verify = verificationId;
                            Navigator.pushNamed(context, 'login_otp');
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      }else{
                        Fluttertoast.showToast(
                            msg: "Please Enter a Valid Number",
                        );
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff64CCC5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    ),
                    child: const Text('Send the Code'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
