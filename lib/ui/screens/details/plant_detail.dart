import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';

class PlantDetail extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String latinName;
  final String family;
  final String description;
  final String goodPart;
  final List<String> efficacy;
  const PlantDetail(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.latinName,
      required this.family,
      required this.description,
      required this.goodPart,
      required this.efficacy})
      : super(key: key);

  @override
  State<PlantDetail> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantDetail> {
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
                  child: Image.network(
                    widget.imageUrl,
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
                            Text(widget.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.black,
                                )),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            const Text('Nama Latin :   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(widget.latinName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Constants.blackColor,
                                  fontStyle: FontStyle.italic,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Nama Famili :   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(widget.family,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Constants.blackColor,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Bahan Bermanfaat :   ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(widget.goodPart,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Constants.blackColor,
                                ))
                          ],
                        ),
                        const SizedBox(height: 50),
                        //data const
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
                        const Text('Penyakit yang dapat diobati',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Container(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Column(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: widget.efficacy.length,
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
                                                        'assets/images/mortar1.png'),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.efficacy[index]
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
