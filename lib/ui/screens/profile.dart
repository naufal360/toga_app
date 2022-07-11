// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toga_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Constants.primaryColor, Colors.greenAccent])),
              child: Container(
                width: double.infinity,
                height: 400.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://storage.googleapis.com/pi-storage-1/storage1/profile.jpg",
                        ),
                        radius: 50.0,
                        backgroundColor: Colors.white70,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Ahmad Naufal Fadhil",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "50419339",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Informatika",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Kontak :",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: _emailUrl,
                                  child: Column(
                                    children: <Widget>[
                                      const IconButton(
                                        icon: FaIcon(FontAwesomeIcons.envelope),
                                        onPressed: null,
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: _linkedinUrl,
                                  child: Column(
                                    children: <Widget>[
                                      const IconButton(
                                        icon: FaIcon(FontAwesomeIcons.linkedin),
                                        onPressed: null,
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Text(
                                        "Linkedin",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black54,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: IconButton(
                              //     icon: const FaIcon(FontAwesomeIcons.envelope),
                              //     onPressed: _githubUrl,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Developer background:",
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Ahmad Naufal Fadhil adalah seorang mahasiswa universitas gunadarma yang merancang aplikasi Toga app.',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    ));
  }

  _linkedinUrl() async {
    const url = 'https://www.linkedin.com/in/naufal360/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _emailUrl() async {
    const url = 'mailto:naufal360.an@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
