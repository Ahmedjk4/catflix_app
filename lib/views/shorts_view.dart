import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../pages/shorts_content_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ShortsView extends StatefulWidget {
  const ShortsView({super.key});

  @override
  State<ShortsView> createState() => _ShortsViewState();
}

class _ShortsViewState extends State<ShortsView> {
  @override
  void initState() {
    super.initState();
  }

  Future listFiles() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child('shorts').listAll();

    List<String> newVideos = [];
    for (var item in result.items) {
      var url = await item.getDownloadURL();
      if (!newVideos.contains(url) && !videos.contains(url)) {
        newVideos.add(url);
      }
    }
    videos.addAll(newVideos);
  }

  List<String> videos = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listFiles(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder<Box>(
            valueListenable: Hive.box('index').listenable(),
            builder: (context, box, widget) => Stack(
              children: [
                Swiper(
                  index: box.get('currentIndex', defaultValue: 0),
                  itemBuilder: (BuildContext context, int index) {
                    return ContentScreen(
                      src: videos[index],
                    );
                  },
                  onIndexChanged: (value) {
                    box.put('currentIndex', value);
                  },
                  itemCount: videos.length,
                  scrollDirection: Axis.vertical,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Flutter Shorts',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // You can return a loading indicator here while waiting for videos to load
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
