import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:organaki_app/models/singleton_user.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/services/shared_preferences_controller.dart';

class ProducerAccountPage extends StatefulWidget {
  const ProducerAccountPage({super.key});

  @override
  State<ProducerAccountPage> createState() => _ProducerAccountPageState();
}

class _ProducerAccountPageState extends State<ProducerAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        title: Text(
          "Account",
          style: TextStyle(
            color: ColorApp.dark1,
            fontSize: 36,
            fontWeight: FontWeight.w600,
            fontFamily: 'Abhaya Libre',
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.sizeH,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 124.0,
                    height: 124.0,
                    decoration: BoxDecoration(
                      color: ColorApp.dark1,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      size: 62.0,
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Center(
                      child: Text(
                        "Producer Name",
                        style: TextStyle(
                          color: ColorApp.blue3,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Abhaya Libre',
                        ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        "Producer Email",
                        style: TextStyle(
                          color: ColorApp.grey2,
                          fontSize: 15,
                          fontFamily: 'Abhaya Libre',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.sizeH,
              const Row(
                children: [],
              ),
              Text(
                "General",
                style: TextStyle(
                  color: ColorApp.blue3,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Abhaya Libre',
                ),
              ),
              20.sizeH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.push("/producerEdit"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "Edit information",
                            style: TextStyle(
                              color: ColorApp.blue3,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Abhaya Libre',
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorApp.grey5,
                          )
                        ],
                      ),
                    ),
                  ),
                  10.sizeH,
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "Enable notification",
                            style: TextStyle(
                              color: ColorApp.blue3,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Abhaya Libre',
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorApp.grey5,
                          )
                        ],
                      ),
                    ),
                  ),
                  10.sizeH,
                  TextButton(
                    onPressed: () {
                      SingletonUser().removeUserAuth();
                      SharedPreferencesAuthController.logoutSharedPreferences();
                      context.go('/account');
                      //TODO aplly flushbar logout here
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: ColorApp.blue3,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
