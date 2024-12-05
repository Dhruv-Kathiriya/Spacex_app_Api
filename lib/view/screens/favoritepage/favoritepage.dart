import 'package:advance_flutter_exam_app/Modal/spacexModal.dart';
import 'package:advance_flutter_exam_app/spacexcontrollres/SpacexConttrols.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("favorite page"),
      ),
      body: Consumer<SpacexConttrols>(
        builder: (context, provider, _) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              childAspectRatio: 0.7,
              crossAxisSpacing: 5,
            ),
            itemCount: provider.Likedata.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => provider.removelikedata(
                  name: provider.Likedata[index],
                ),
                child: ListTile(
                  title: Text("${provider.Likedata[index]}"),
                  trailing: IconButton(
                      onPressed: () {
                        provider.removelikedata(name: provider.Likedata[index]);
                      },
                      icon: Icon(Icons.delete)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
