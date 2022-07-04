import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toga_app/constant.dart';
import 'package:toga_app/services/dio_services.dart';
import 'package:toga_app/ui/screens/details/plant_detail.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({Key? key}) : super(key: key);

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  List<TanamanBaru> buckets = [];

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data API
    getTanamanData();
  }

  void getTanamanData() async {
    buckets = await getAllData();
    if (buckets != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _runFilter(String value) async {
    List<TanamanBaru> result = [];
    if (value.isEmpty) {
      result = await getAllData();
    } else {
      var dataCari = await getSearching(value);
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
                          onChanged: ((value) => _runFilter(value)),
                          decoration: const InputDecoration(
                            hintText: 'Cari "Temulawak"',
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
                                width: 55.0,
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  height: 80.0,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(
                                            buckets[index].imageUrl),
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
                                      buckets[index].latinName.length > 25
                                          ? buckets[index]
                                                  .latinName
                                                  .substring(0, 25) +
                                              '...'
                                          : buckets[index].latinName,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                      ),
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
                                    builder: (context) => PlantDetail(
                                      imageUrl: buckets[index].imageUrl,
                                      name: buckets[index].name,
                                      latinName: buckets[index].latinName,
                                      family: buckets[index].family,
                                      description: buckets[index].description,
                                      goodPart: buckets[index].goodPart,
                                      efficacy: buckets[index].efficacy,
                                    ),
                                  ));
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
