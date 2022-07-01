import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomePageState();
}

class _HomePageState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/intro.jpg',
                    width: 400,
                    height: 400,
                    fit: BoxFit.fill,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Constants.primaryColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin:
                        const EdgeInsets.only(top: 410, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(Constants.homedetailTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.black,
                                )),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(Constants.homedetailSubTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 10),
                        Text(Constants.homedetailParagraphOne,
                            style: TextStyle(
                              fontSize: 18,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 10),
                        Text(Constants.homedetailParagraphTwo,
                            style: TextStyle(
                              fontSize: 18,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 5),
                        Text('1. Upaya preventif (pencegahan)',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Constants.blackColor,
                            )),
                        Text(
                            '2. Upaya promotive (meningkatkan/menjaga kesehatan)',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Constants.blackColor,
                            )),
                        Text('3. Upaya kuratif (penyembuhan penyakit)',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 75),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
