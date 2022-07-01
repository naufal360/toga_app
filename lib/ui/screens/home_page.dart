import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toga_app/models/medikasi.dart';
import 'package:toga_app/ui/screens/details/home_detail.dart';
import 'package:toga_app/ui/screens/details/medic_detail.dart';
import 'package:toga_app/ui/screens/details/plant_detail.dart';

import '../../constant.dart';
import '../../models/tanaman.dart';
import '../../services/remote_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tanaman>? tanamans;
  List<Medikasi>? medikasi;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // fetch data API
    getTanamanData();
    getMedikasiData();
  }

  Future getTanamanData() async {
    tanamans = await RemoteController().getTanamans();
    if (tanamans != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future getMedikasiData() async {
    medikasi = await RemoteController().getMedikasis();
    if (medikasi != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tahukah kamu apa itu Toga?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
            ),
            SizedBox(
                height: size.height * .3,
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: AssetImage('assets/images/intro.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Definisi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Tanaman Obat Keluarga',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HomeDetail()));
                              },
                              icon: const FaIcon(FontAwesomeIcons.arrowRight),
                              color: Constants.primaryColor),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'Jenis jenis Toga',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: tanamans?.length ?? 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child:
                                      Image.network(tanamans![index].imageUrl),
                                )),
                          ),
                          Positioned(
                            top: 30,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tanamans![index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  tanamans![index].latinName.length > 20
                                      ? '${tanamans![index].latinName.substring(0, 20)}...'
                                      : tanamans![index].latinName,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PlantDetail(
                                                imageUrl:
                                                    tanamans![index].imageUrl,
                                                name: tanamans![index].name,
                                                latinName:
                                                    tanamans![index].latinName,
                                                family: tanamans![index].family,
                                                description: tanamans![index]
                                                    .description,
                                                goodPart:
                                                    tanamans![index].goodPart,
                                                efficacy: tanamans![index]
                                                    .efficacy)));
                                  },
                                  icon:
                                      const FaIcon(FontAwesomeIcons.arrowRight),
                                  color: Constants.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 25),
              child: const Text(
                'Pengobatan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: medikasi?.length ?? 0,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80.0,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  height: 50.0,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/images/medic.png'),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      medikasi![index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Constants.blackColor,
                                      ),
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      medikasi![index].description.length > 20
                                          ? medikasi![index]
                                                  .description
                                                  .substring(0, 20) +
                                              '...'
                                          : medikasi![index].description,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MedicDetail(
                                            name: medikasi![index].name,
                                            description:
                                                medikasi![index].description,
                                            material: medikasi![index].material,
                                            make: medikasi![index].make,
                                            consume: medikasi![index].consume,
                                            moreAbout:
                                                medikasi![index].moreAbout,
                                          )));
                                },
                                icon: const FaIcon(FontAwesomeIcons.arrowRight),
                                color: Constants.primaryColor),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
