import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toga_app/constant.dart';
import 'package:toga_app/services/dio_services.dart';
import 'package:toga_app/ui/screens/details/medic_detail.dart';

class MedicalPage extends StatefulWidget {
  const MedicalPage({Key? key}) : super(key: key);

  @override
  State<MedicalPage> createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  List<MedikasiBaru> buckets = [];

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data API
    getMedikasiData();
  }

  void getMedikasiData() async {
    buckets = await getAllDataMed();
    if (buckets != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _runFilter(String value) async {
    List<MedikasiBaru> result = [];
    if (value.isEmpty) {
      result = await getAllDataMed();
    } else {
      var dataCari = await getSearchingMed(value);
      result = dataCari;
    }
    setState(() {
      buckets = result;
    });
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
                      horizontal: 22.0,
                    ),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                            hintText: 'Cari "Batuk"',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              height: size.height * .7,
              child: ListView.builder(
                  itemCount: buckets.length,
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  height: 80.0,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: const AssetImage(
                                            'assets/images/bandage.png'),
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
                                      buckets[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Constants.blackColor,
                                      ),
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      buckets[index].description.length > 20
                                          ? buckets[index]
                                                  .description
                                                  .substring(0, 20) +
                                              '...'
                                          : buckets[index].description,
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
                                            name: buckets[index].name,
                                            description:
                                                buckets[index].description,
                                            material: buckets[index].material,
                                            make: buckets[index].make,
                                            consume: buckets[index].consume,
                                            moreAbout: buckets[index].moreAbout,
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
