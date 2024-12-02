import 'package:belajar/Component/Button/customButton.dart';
import 'package:belajar/home_stateless.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    saveToLocal();
  }

  Future<void> saveToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '1234');

  }

  void getFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Flutter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //   Text(
          //   'Hello, world!',
          //   style: TextStyle(
          //     fontSize: 24.0,
          //     color: Colors.blue,
          //     decoration: TextDecoration.overline,
          //     fontWeight: FontWeight.bold,
          //     backgroundColor: Colors.red,
          //   ),
          //   textAlign: TextAlign.center,
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
          ElevatedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeStateless()));
            },
            child: Text(
              'Stateless',
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  fontSize: 20),
            ),
          ),
          CustomButton(buttonText: "Stateful", onPressed: (){
            getFromLocal();
            print("Stateful");
          })
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          print(index);
        },
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
