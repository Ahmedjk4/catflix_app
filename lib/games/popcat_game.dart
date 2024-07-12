import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PopcatGame extends StatefulWidget {
  const PopcatGame({super.key});

  @override
  State<PopcatGame> createState() => _PopcatGameState();
}

class _PopcatGameState extends State<PopcatGame>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String _currentImage = 'assets/p.png';
  bool _isPressed = false;
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    updateCounter();
  }

  Future<void> updateCounter() async {
    if (mounted) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserUid != null) {
        final userSnapshot =
            await db.collection("users").doc(currentUserUid).get();
        if (userSnapshot.exists) {
          final currentCount = userSnapshot.data()!['count'];
          setState(() {
            _counter = currentCount;
          });
        }
      }
    }
  }

  Future<void> changeImage() async {
    if (mounted) {
      Future.delayed(Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            _currentImage = 'assets/p.png';
          });
        }
      });
      setState(() {
        _currentImage =
            _currentImage == 'assets/p.png' ? 'assets/op.png' : 'assets/p.png';
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopCat'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_counter.toString(), style: TextStyle(fontSize: 50)),
            GestureDetector(
              onTapDown: (details) async {
                if (mounted) {
                  final player = AudioPlayer();
                  player.play(AssetSource('pop2.ogg'));
                  _counter++;
                  changeImage();
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
                  if (currentUserUid != null) {
                    final userSnapshot =
                        await db.collection("users").doc(currentUserUid).get();
                    if (userSnapshot.exists) {
                      final currentCount = userSnapshot.data()!['count'];
                      userSnapshot.reference
                          .update({'count': currentCount + 1});
                    } else {
                      final user = <String, dynamic>{
                        "uid": currentUserUid,
                        "name": FirebaseAuth.instance.currentUser?.displayName,
                        "count": _counter,
                      };
                      db.collection("users").doc(currentUserUid).set(user).then(
                          (value) => print(
                              'DocumentSnapshot added with ID: $currentUserUid'));
                    }
                  }
                }
              },
              onTapUp: (details) {
                changeImage();
              },
              child: Image.asset(
                _currentImage,
                cacheHeight: 200,
                cacheWidth: 200,
              ),
            ),

            // ExpansionPanelList(
            //   children: [
            //     ExpansionPanel(
            //         headerBuilder: (context, bool isExpanded) {
            //           return Text('Not A');
            //         },
            //         body: Text('a'),
            //         isExpanded: false),
            //     ExpansionPanel(
            //         headerBuilder: (context, bool isExpanded) {
            //           return Text('Not A');
            //         },
            //         body: Text('a'),
            //         isExpanded: false),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
