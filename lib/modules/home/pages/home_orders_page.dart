import 'package:flutter/material.dart';
import 'package:organaki_app/core/colors_app.dart';

class HomeOrdersPage extends StatefulWidget {
  const HomeOrdersPage({Key? key}) : super(key: key);

  @override
  State<HomeOrdersPage> createState() => _HomeOrdersPageState();
}

class _HomeOrdersPageState extends State<HomeOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        title: Text(
          "Search",
          style: TextStyle(
            color: ColorApp.dark1,
            fontSize: 36,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: ColorApp.blue3,
            ),
            tooltip: 'Open search filters',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextField(
                style: TextStyle(
                  color: ColorApp.dark1,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Abhaya Libre',
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Icon(
                      Icons.search_rounded,
                      color: ColorApp.blue4,
                      size: 26,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                    top: 30,
                  ),
                  filled: true,
                  fillColor: ColorApp.white4,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Procure produtores, endereços, produtos",
                  hintStyle: TextStyle(
                    color: ColorApp.grey3,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Abhaya Libre',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                right: 25,
                left: 25,
              ),
              child: Row(
                children: [
                  Text(
                    'Recently Searched',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorApp.dark1,
                      fontFamily: 'Abhaya Libre',
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'CLEAR ALL',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: ColorApp.blue3,
                      fontFamily: 'Abhaya Libre',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
