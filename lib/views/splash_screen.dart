// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:catflix/pages/main_page.dart';
import 'package:catflix/pages/nointernet_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future delay() async {
    final player = AudioPlayer();
    await player.play(AssetSource('splashaudio.mp3'));

    Future.delayed(const Duration(seconds: 6), () async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const NoInternetPage();
        }));
      } else if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        backgroundColor: Colors.black,
        body: content(),
      ),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        child: Lottie.asset(
          options: LottieOptions(),
          addRepaintBoundary: true,
          backgroundLoading: false,
          'assets/catflixsplash.json',
        ),
      ),
    );
  }
}
