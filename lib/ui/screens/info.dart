import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                Constants.titleApp,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                Constants.version,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    Constants.tujuanApp,
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Kembali'),
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
