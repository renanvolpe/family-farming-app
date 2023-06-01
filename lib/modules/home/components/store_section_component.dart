import 'package:flutter/material.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/models/producer.dart';

class StoreSectionComponent extends StatelessWidget {
   const StoreSectionComponent({super.key, 
  required this.producer   
  });
  final Producer producer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorApp.grey1),
                  child: const FlutterLogo(
                    size: 30,
                  )),
              8.sizeW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producer.companyName,
                    style: TextStyle(color: ColorApp.blue3, fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text(
                       producer.email,
                        style: TextStyle(color: ColorApp.grey2, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: ColorApp.grey1,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.heart_broken,
                    color: Colors.red,
                  ))
            ],
          ),
          10.sizeH,
          const Divider(),
          10.sizeH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.airplane_ticket_outlined,
                    color: Colors.blue,
                  ),
                  3.sizeW,
                  const Text(
                    "200m",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      size: 18,
                      color: i == 4 ? ColorApp.grey1 : Colors.yellow,
                    ),
                  Text(
                    "(1.293)",
                    style: TextStyle(color: ColorApp.grey2, fontSize: 14),
                  ),
                ],
              ),
              const Text(
                "OPEN",
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            ],
          ),
          20.sizeH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: ColorApp.grey1,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const FlutterLogo(
                      size: 45,
                    ))
            ],
          )
        ],
      ),
    );
  }
}
