import 'package:belajar/simpleHttp.dart';
import 'package:flutter/material.dart';

class HomeStateless extends StatelessWidget {
  const HomeStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Flutter'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimpleHttp(
                      data: "Stateless $index",
                    ),

                  ),
                );

                // Navigator.pop(context);
              },
              child: Text(
                'Stateless $index',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
