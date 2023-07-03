import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:organaki_app/models/producer.dart';
import 'package:organaki_app/modules/home/bloc/bloc_get_list_producer/get_list_producers_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/core/colors_app.dart';

class HomeOrdersPage extends StatefulWidget {
  const HomeOrdersPage({Key? key}) : super(key: key);

  @override
  State<HomeOrdersPage> createState() => _HomeOrdersPageState();
}

class _HomeOrdersPageState extends State<HomeOrdersPage> {
  bool isDistanceEnabled = false;
  bool isOpeningHoursEnabled = false;
  bool isTagsEnabled = false;
  double distanceValue = 0.0;
  LatLng? currentLatlong;
  final _mapController = MapController();
  late MapOptions _mapOption;
  late List<Producer>? listProducers; // list to filter the producers
  List<Producer> allProducers = []; //fixed list to evet get all producers
  TextEditingController textFilterController = TextEditingController();

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.80,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Distance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorApp.black,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    trailing: CustomSwitchButton(
                      value: isDistanceEnabled,
                      onChanged: (value) {
                        setState(() {
                          isDistanceEnabled = value;
                        });
                      },
                    ),
                  ),
                  if (isDistanceEnabled) const DistanceFilter(),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Opening Hours',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorApp.black,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    trailing: CustomSwitchButton(
                      value: isOpeningHoursEnabled,
                      onChanged: (value) {
                        setState(() {
                          isOpeningHoursEnabled = value;
                        });
                      },
                    ),
                  ),
                  if (isOpeningHoursEnabled) const OpeningHoursFilter(),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Tags',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorApp.black,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                    trailing: CustomSwitchButton(
                      value: isTagsEnabled,
                      onChanged: (value) {
                        setState(() {
                          isTagsEnabled = value;
                        });
                      },
                    ),
                  ),
                  if (isTagsEnabled) const TagsFilter(),
                  30.sizeH,
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(348, 58),
                              backgroundColor: ColorApp.blue3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0))),
                          onPressed: () {
                            // Aplicar o filtro e fechar o showModalBottomSheet
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Save and Use',
                            style: TextStyle(
                              color: ColorApp.white1,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Abhaya Libre',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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

  //function to list and update depended on searched
  void filterListProducersByText(String text) {
    List<Producer> newListProducers = [];
    for (int i = 0; i < allProducers.length; i++) {
      if (allProducers[i].name.toLowerCase().contains(text.toLowerCase())) {
        newListProducers.add(allProducers[i]);
      }
    }
    setState(() {
      listProducers = newListProducers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<GetListProducersBloc, GetListProducersState>(
          builder: (context, state) {
            if (state is GetListProducersProgress) {
              return const CircularProgressIndicator();
            }
            if (state is GetListProducersSuccess) {
              allProducers = state.listProducers;
              listProducers == null
                  ? listProducers = state.listProducers
                  : null;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.black,
                              fontFamily: 'Abhaya Libre',
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _showFilterModal(
                                  context); // Implementar ação do botão de filtro aqui
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorApp.blue3,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: ColorApp.white1,
                                  fontFamily: 'Abhaya Libre'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            icon: Icon(
                              Icons.filter_list,
                              color: ColorApp.white1,
                            ),
                            label: Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: ColorApp.white1,
                                fontFamily: 'Abhaya Libre',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: ColorApp.white4,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: ColorApp.grey3,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: textFilterController,
                                onChanged: (text) {
                                  filterListProducersByText(text);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search Foods, Restaurants etc.',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: ColorApp.grey3,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Abhaya Libre',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recently Searched',
                            style: TextStyle(
                                color: ColorApp.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Abhaya Libre'),
                          ),
                          TextButton(
                            onPressed: () {
                              //remove filter of the text and call function to list text with nothing in text
                              setState(() {
                                textFilterController.text = "";
                                filterListProducersByText("");
                              });
                            },
                            child: Text(
                              'CLEAR ALL',
                              style: TextStyle(
                                fontSize: 10,
                                color: ColorApp.blue3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < listProducers!.length; i++)
                      InkWell(
                        onTap: () =>
                            context.push("/order/producerDetail", extra: {
                          "id": listProducers![i].id,
                          "mapOptions": _mapOption,
                          "mapController": _mapController,
                          "currentPosition": currentLatlong!,
                        }),
                        child: Column(
                          children: [
                            10.sizeH,
                            ListTile(
                              leading: const CircleAvatar(),
                              title: Text(listProducers![i].name),
                              subtitle: Text(
                                listProducers![i].description,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                            ),
                            10.sizeH,
                            Divider(
                              color: ColorApp.grey1,
                            ),
                          ],
                        ),
                      ),
                    20.sizeH
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class DistanceFilter extends StatefulWidget {
  const DistanceFilter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DistanceFilterState createState() => _DistanceFilterState();
}

class _DistanceFilterState extends State<DistanceFilter> {
  double minDistance = 0.0;
  double maxDistance = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          min: 0.0,
          max: 100.0,
          divisions: 100,
          value: maxDistance,
          onChanged: (value) {
            setState(() {
              maxDistance = value;
            });
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0 km',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.black,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
              Text(
                '${maxDistance.toInt()} km',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.black,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OpeningHoursFilter extends StatefulWidget {
  const OpeningHoursFilter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OpeningHoursFilterState createState() => _OpeningHoursFilterState();
}

class _OpeningHoursFilterState extends State<OpeningHoursFilter> {
  TimeOfDay selectedFromTime = TimeOfDay.now();
  TimeOfDay selectedToTime = TimeOfDay.now();

  Future<void> _selectFromTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedFromTime,
    );
    if (picked != null && picked != selectedFromTime) {
      setState(() {
        selectedFromTime = picked;
      });
    }
  }

  Future<void> _selectToTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedToTime,
    );
    if (picked != null && picked != selectedToTime) {
      setState(() {
        selectedToTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'From: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectFromTime(context),
                  child: Text(
                    selectedFromTime.format(context),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorApp.black,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'To: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.black,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectToTime(context),
                  child: Text(
                    selectedToTime.format(context),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorApp.black,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}

class TagsFilter extends StatefulWidget {
  const TagsFilter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TagsFilterState createState() => _TagsFilterState();
}

class _TagsFilterState extends State<TagsFilter> {
  List<String> selectedTags = [];

  List<String> availableTags = ['Herbs', 'Fruits', 'Vegetables'];

  bool isTagSelected(String tag) {
    return selectedTags.contains(tag);
  }

  void toggleTag(String tag) {
    setState(() {
      if (isTagSelected(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  Widget buildTag(String tag) {
    final bool isSelected = isTagSelected(tag);

    return GestureDetector(
      onTap: () => toggleTag(tag),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          children: availableTags.map((tag) => buildTag(tag)).toList(),
        ),
      ],
    );
  }
}

class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchButton({
    Key? key,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        width: 50.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: _value ? ColorApp.blue3 : ColorApp.grey3,
        ),
        child: Row(
          mainAxisAlignment:
              _value ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: 26.0,
              height: 26.0,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorApp.white1,
              ),
              child: _value
                  ? Icon(
                      Icons.check,
                      color: ColorApp.blue3,
                      size: 20.0,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
