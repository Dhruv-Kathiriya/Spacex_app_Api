import 'package:advance_flutter_exam_app/Modal/spacexModal.dart';
import 'package:advance_flutter_exam_app/view/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../../../spacexcontrollres/SpacexConttrols.dart';

class DetalisPage extends StatefulWidget {
  const DetalisPage({super.key});

  @override
  State<DetalisPage> createState() => _DetalisPageState();
}

class _DetalisPageState extends State<DetalisPage> {
  @override
  Widget build(BuildContext context) {
    SpacexModal spacexModal =
        ModalRoute.of(context)!.settings.arguments as SpacexModal;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalis Page"),
        centerTitle: true,
        actions: [
          Consumer<SpacexConttrols>(builder: (context, provider, _) {
            return IconButton(
              onPressed: () {
                provider.like();
                provider.addLikeData(spacexModal: spacexModal);
              },
              icon: Icon(
                  provider.islike ? Icons.star : Icons.star_border_outlined),
            );
          })
        ],
      ),
      body: Align(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  image: DecorationImage(
                    image: NetworkImage(spacexModal.links.patch.large!),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name : ${spacexModal.name!}"),
                      const SizedBox(
                        height: 7,
                      ),
                      Text("Detalis : ${spacexModal.details ?? "No Detalis"}"),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                          "Articals : ${spacexModal.links.article ?? "No Articals"}"),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            spacexModal.links.patch.small ?? null.toString(),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          spacexModal.staticFireDateUnix.toString(),
                        ),
                      ]),
                      Text(
                        "flight_number : ${spacexModal.flightNumber ?? "No flight_number"}",
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
