import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_a_producer/get_a_producer_bloc.dart';

class ProducerApresentationPage extends StatefulWidget {
  const ProducerApresentationPage(
      {super.key,
      required this.mapOptions,
      required this.mapController,
      required this.currentPosition,
      required this.id});
  final MapOptions mapOptions;
  final MapController mapController;
  final LatLng currentPosition;
  final String id;
  @override
  State<ProducerApresentationPage> createState() =>
      _ProducerApresentationPageState();
}

class _ProducerApresentationPageState extends State<ProducerApresentationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetAProducerBloc>(context)
        .add(GetAProducerStart(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            weight: 10,
          ),
        ),
        title: Text(
          "Producer",
          style: TextStyle(
            color: ColorApp.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: ColorApp.grey1,
            height: 1,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: BlocBuilder<GetAProducerBloc, GetAProducerState>(
          builder: (context, state) {
            if (state is GetAProducerProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetAProducerSuccess) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.sizeH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.producer.companyName,
                          style: TextStyle(
                            color: ColorApp.blue3,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Abhaya Libre',
                          ),
                        ),
                      ],
                    ),
                    15.sizeH,
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          state.producer.name,
                          style: TextStyle(
                            color: ColorApp.blue3,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Abhaya Libre',
                          ),
                        ),
                        subtitle: Text(
                          state.producer.email,
                          style: TextStyle(
                            color: ColorApp.grey2,
                            fontSize: 15,
                            fontFamily: 'Abhaya Libre',
                          ),
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
                    Text(
                      "About Producer",
                      style: TextStyle(
                        color: ColorApp.blue3,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    15.sizeH,
                    Text(
                      state.producer.description,
                      style: TextStyle(
                        color: ColorApp.grey2,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    15.sizeH,
                    Text(
                      "Photos product",
                      style: TextStyle(
                        color: ColorApp.blue3,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
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
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
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
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    15.sizeH,
                    LayoutBuilder(
                      builder: (context, onstraints) => SizedBox(
                          height: 220,
                          child: Stack(
                            children: [
                              AbsorbPointer(
                                child: SizedBox(
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
                                            point: LatLng(
                                                double.parse(
                                                    state.producer.latitude),
                                                double.parse(
                                                    state.producer.longitude)),
                                            builder: (context) => Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: ColorApp.blue3,
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () async {
                                    var availableMaps = await launcher
                                        .MapLauncher.installedMaps;
                                    //ignore: use_build_context_synchronously
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Selecione o aplicativo que queria abrir",
                                                      style: TextStyle(
                                                        color: ColorApp.dark2,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              for (var map in availableMaps)
                                                InkWell(
                                                  onTap: () {
                                                    map.showMarker(
                                                      coords: launcher.Coords(
                                                          double.parse(state
                                                              .producer
                                                              .latitude),
                                                          double.parse(state
                                                              .producer
                                                              .longitude)),
                                                      title: "Destination",
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 80,
                                                          width: 80,
                                                          child:
                                                              SvgPicture.asset(
                                                            map.icon,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          map.mapName,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              10.sizeH
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 194,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 25),
                                    decoration: BoxDecoration(
                                        color: ColorApp.blue3,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Abhaya Libre',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: Text("Errou um erro inesperado"),
            );
          },
        ),
      ),
    );
  }
}
