// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicDetail extends StatefulWidget {
  final String name;
  final String description;
  final List<String> material;
  final String make;
  final String consume;
  final String moreAbout;
  const MedicDetail({
    Key? key,
    required this.name,
    required this.description,
    required this.material,
    required this.make,
    required this.consume,
    required this.moreAbout,
  }) : super(key: key);

  @override
  State<MedicDetail> createState() => _MedicPageState();
}

class _MedicPageState extends State<MedicDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 52, left: 22, right: 22, bottom: 22),
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
                        const EdgeInsets.only(top: 190, left: 22, right: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(widget.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.black,
                                )),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(height: 50),
                        const Text('Deskripsi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 10),
                        Text(widget.description,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 50),
                        const Text('Bahan yang diperlukan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Container(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Column(
                            children: [
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.material.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Constants.primaryColor
                                                  .withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              height: 30.0,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: const Image(
                                                    image: AssetImage(
                                                        'assets/images/mortar2.png'),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.material[index]
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 75),
                        const Text('Cara membuat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 10),
                        Text(widget.make,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 25),
                        const Text('Cara mengkonsumsi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 10),
                        Text(widget.consume,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Constants.blackColor,
                            )),
                        const SizedBox(height: 25),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                              onPressed: () async {
                                var url = widget.moreAbout;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Info lebih lanjut tidak ditemukan';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text('Info lebih lanjut',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold))),
                        ),
                        const SizedBox(height: 25),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
