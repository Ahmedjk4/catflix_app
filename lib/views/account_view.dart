import 'package:catflix/pages/change_name_page.dart';
import 'package:catflix/pages/change_password_page.dart';
import 'package:catflix/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Text(
                  FirebaseAuth.instance.currentUser?.displayName ?? "No Name",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                IconButton(
                    enableFeedback: true,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ChangeNamePage();
                      }));
                    },
                    icon: const Icon(Icons.edit, color: Colors.black))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? "No Email",
              style: const TextStyle(color: Colors.black, fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                color: Colors.red,
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ChangePasswordPage();
                    }));
                  },
                  child: const Text(
                    "Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                color: Theme.of(context).colorScheme.secondary,
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    // FirebaseAuth.instance.currentUser
                    //     ?.updateDisplayName("Ahmed ElSaeed");
                    AuthService(context: context).logOut();
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
