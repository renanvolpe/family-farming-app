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

class HomeProducersPage extends StatefulWidget {
  const HomeProducersPage({Key? key}) : super(key: key);

  @override
  State<HomeProducersPage> createState() => _HomeProducersPage();
}

class _HomeProducersPage extends State<HomeProducersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    BlocProvider.of<GetListProducersBloc>(context).add(GetListProducersStart());
  }

  List<GetListProducersBloc> recentlySearched = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Implement your filter logic here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Implement your search logic here
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentlySearched.length,
              itemBuilder: (context, index) {
                if (index < recentlySearched.length) {
                  return ListTile(
                    title: Text(recentlySearched[index] as String),
                    onTap: () {
                      // Handle recently searched item tap
                    },
                  );
                }
                return null;
              },
            ),
          ),
          if (recentlySearched.isNotEmpty)
            TextButton(
              onPressed: () {
                setState(() {
                  recentlySearched.clear();
                });
              },
              child: const Text('Clear All'),
            ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Producer List'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeProducersPage()),
            );
          },
        ),
      ),
    );
  }
}
