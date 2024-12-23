import 'package:advance_flutter_exam_app/Modal/spacexModal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/helpers.dart';
import '../../../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ApiHelper.apiHelper.spacexApiHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spacex App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.spacexApiHelper(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("ERROR : ${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            List<SpacexModal> spacex = snapShot.data!;
            return GridView.builder(
              itemCount: spacex.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detalis,
                      arguments: spacex![index],
                    );
                  },
                  child: Card(
                    surfaceTintColor: Colors.grey,
                    child: Column(
                      children: [
                        Spacer(),
                        Image.network(spacex![index].links.patch.large!),
                        Spacer(),
                        Text("name : ${spacex[index].name}"),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.favorites);
        },
        child: Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}
