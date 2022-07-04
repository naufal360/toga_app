import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';

class infoPage extends StatefulWidget {
  const infoPage({Key? key}) : super(key: key);

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Toga App',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'v.1.0.0',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Aplikasi ini bertujuan sebagai sarana edukasi dan sebagai objek penelitian ilmiah.",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Kembali'),
                style:
                    ElevatedButton.styleFrom(primary: Constants.primaryColor),
              ),
            )
          ],
        )),
      ),
    );
  }
}
