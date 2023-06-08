import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';

class ProducerApresentationPage extends StatefulWidget {
  const ProducerApresentationPage(
      {super.key,
      required this.mapOptions,
      required this.mapController,
      required this.currentPosition});
  final MapOptions mapOptions;
  final MapController mapController;
  final LatLng currentPosition;
  @override
  State<ProducerApresentationPage> createState() =>
      _ProducerApresentationPageState();
}

class _ProducerApresentationPageState extends State<ProducerApresentationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text("Producer"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: ColorApp.grey1,
              height: 1,
            ),
          )),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  "Nararaya Kirana",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                subtitle: Text(
                  "nararaya.putri@mail.com",
                  style: TextStyle(color: ColorApp.grey2, fontSize: 15),
                ),
                trailing: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorApp.grey2,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                )),
            15.sizeH,
            const Text(
              "About Producer",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            15.sizeH,
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
              style: TextStyle(
                  color: ColorApp.grey2,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            15.sizeH,
            const Text(
              "Photos product",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            15.sizeH,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      5,
                      (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: ColorApp.grey1,
                                borderRadius: BorderRadius.circular(8)),
                            child: const FlutterLogo(size: 60),
                          ))),
            ),
            15.sizeH,
            const Text(
              "Producer Location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            15.sizeH,
            LayoutBuilder(
              builder: (context, onstraints) => SizedBox(
                  height: 220,
                  child: AbsorbPointer(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: FlutterMap(
                            mapController: widget.mapController,
                            options: widget.mapOptions,
                            nonRotatedChildren: const [],
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: widget.currentPosition,
                                    builder: (context) => Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: ColorApp.blue3,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.location_history,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                                color: ColorApp.blue3,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.my_location,
                                  color: Colors.white,
                                ),
                                15.sizeW,
                                const Text(
                                  "Go to \n Location",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
