import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitify/Screens/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var arrName = [
      'Suraj',
      'Chandan',
      'Suraj',
      'Chandan',
      'Navi',
      'Nishu',
      'Navi',
      'Nishu',
      'Suraj',
      'Chandan',
      'Suraj',
      'Chandan',
      'Navi',
      'Nishu',
      'Navi',
      'Nishu'
    ];
    void onSelected(BuildContext context, int item){
      switch(item){
        case 0:
          auth.signOut();
          Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
          break;
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splitify'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black,),
                      SizedBox(width: 20.0),
                      Text("Sign Out"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.account_box_rounded),
              ),
              title: Text(arrName[index]),
              subtitle: const Text('Developing flutter app'),
              onTap: () {
                Navigator.pushNamed(context, 'chat');
              },
            );
          },
          itemCount: arrName.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 500,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  );
                });
          },
          backgroundColor: const Color(0xff64CCC5),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
