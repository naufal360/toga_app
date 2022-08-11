import 'package:flutter/material.dart';
import 'package:toga_app/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlantDetail extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String latinName;
  final String family;
  final String description;
  final String goodPart;
  final List<String> efficacy;
  final String articles;
  final List<String> contained;
  final String youtube;
  const PlantDetail({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.latinName,
    required this.family,
    required this.description,
    required this.goodPart,
    required this.efficacy,
    required this.articles,
    required this.contained,
    required this.youtube,
  }) : super(key: key);

  @override
  State<PlantDetail> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantDetail> {
  late YoutubePlayerController _controller;
  late String? videoUrl = YoutubePlayer.convertUrlToId(widget.youtube);

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: videoUrl!,
        flags: const YoutubePlayerFlags(
            enableCaption: false,
            isLive: false,
            autoPlay: false,
            loop: false,
            mute: false));
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) => Scaffold(
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
                      padding: const EdgeInsets.only(
                          top: 22, left: 22, right: 22, bottom: 22),
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
                          const EdgeInsets.only(top: 410, left: 22, right: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(widget.name,
                                  style: const TextStyle(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
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
                          const SizedBox(height: 30),
                          const Text('Zat yang terkandung:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Column(
                              children: [
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.contained.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10.0,
                                              height: 10.0,
                                              decoration: BoxDecoration(
                                                color: Constants.primaryColor
                                                    .withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SizedBox(
                                                height: 10.0,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image(
                                                      image: AssetImage(
                                                          Constants
                                                              .detailPlantZat),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.contained[index]
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color:
                                                          Constants.blackColor,
                                                    ),
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
                          const SizedBox(height: 25),
                          const Text('Video manfaat dari tanaman:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(height: 20),
                          player,
                          SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () async {
                                var url = widget.youtube;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Youtube tidak ditemukan';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green.shade900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text('Putar di YouTube',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(height: 25),
                          const Text('Penyakit yang dapat diobati',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Column(
                              children: [
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image(
                                                      image: AssetImage(Constants
                                                          .detailPlantImage),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
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
                                                    style: const TextStyle(
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
                          const SizedBox(height: 25),
                          Container(
                            height: 40,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                                onPressed: () async {
                                  var url = widget.articles;
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
                                child: const Text('Artikel mengenai tanaman',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold))),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
