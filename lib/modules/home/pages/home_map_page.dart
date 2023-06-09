import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_list_producer/get_list_producers_bloc.dart';
import 'package:organaki_app/modules/home/components/store_section_component.dart';
// Only import if required functionality is not exposed by default

class HomeMapPage extends StatefulWidget {
  const HomeMapPage({Key? key}) : super(key: key);

  @override
  State<HomeMapPage> createState() => _HomeMapPageState();
}

class _HomeMapPageState extends State<HomeMapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    currentLatlong = await getCurrentPosition();

    setState(() {
      _mapOption = MapOptions(center: currentLatlong!, zoom: 14);
      currentLatlong;
    });
    BlocProvider.of<GetListProducersBloc>(context).add(GetListProducersStart());
  }

  LatLng? currentLatlong;
  final _mapController = MapController();
  late MapOptions _mapOption;

  Future<LatLng?> getCurrentPosition() async {
    LocationPermission response = await Geolocator.requestPermission();
    if (response.name == "whileInUse") {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return LatLng(position.latitude, position.longitude);
    } else {
      // ignore: use_build_context_synchronously
      Flushbar(
              message: 'Você precisa ativar sua localização',
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 6),
              flushbarPosition: FlushbarPosition.TOP)
          .show(context);
    }
    return null;
  }

  void returnCurrentLocation() {
    setState(() {
      _mapController.move(currentLatlong!, 14);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(
            color: ColorApp.blue3,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
      ),
      body: currentLatlong != null // to wait user to get the current value
          ? BlocBuilder<GetListProducersBloc, GetListProducersState>(
              builder: (context, stateListProducer) {
                if (stateListProducer is GetListProducersProgress) {
                  return const Center(
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator()),
                  );
                }
                if (stateListProducer is GetListProducersFailure) {
                  return Center(
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Text(
                            "Ocorreu o erro: ${stateListProducer.errorMessage}")),
                  );
                }
                if (stateListProducer is GetListProducersSuccess) {
                  return FlutterMap(
                    mapController: _mapController,
                    options: _mapOption,
                    nonRotatedChildren: [
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              returnCurrentLocation();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15, right: 15),
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                elevation: 5,
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.my_location,
                                      color: ColorApp.blue3,
                                    )),
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(
                              6,
                              (index) {
                                return InkWell(
                                    onTap: () =>
                                        context.push("/producerDetail", extra: {
                                          "mapOptions": _mapOption,
                                          "mapController": _mapController,
                                          "currentPosition": currentLatlong!,
                                        }),
                                    child: StoreSectionComponent(
                                      producer: stateListProducer
                                          .listProducers[index],
                                    ));
                              },
                            )),
                          ),
                        ),
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: [
                          for (int i = 1; i < 20; i++)
                            Marker(
                              point: i % 2 == 0
                                  ? LatLng(currentLatlong!.latitude + i * 0.01,
                                      currentLatlong!.longitude + i * 0.001)
                                  : LatLng(currentLatlong!.latitude - i * 0.001,
                                      currentLatlong!.longitude - i * 0.01),
                              builder: (context) => Container(
                                height: 15,
                                width: 15,
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
                          Marker(
                            point: currentLatlong!,
                            builder: (context) => Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: ColorApp.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
