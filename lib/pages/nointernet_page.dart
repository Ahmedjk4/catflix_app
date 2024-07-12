// ignore_for_file: use_build_context_synchronously

import 'package:catflix/pages/main_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.error, size: 50, color: Colors.red),
              const Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 20),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  var connectivityResult =
                      await Connectivity().checkConnectivity();
                  if (connectivityResult == ConnectivityResult.none) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("No Internet")));
                  } else if (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.wifi) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
