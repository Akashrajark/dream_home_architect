import 'package:dreamhome_architect/common_widgets.dart/change_password.dart';
import 'package:dreamhome_architect/common_widgets.dart/custom_alert_dialog.dart';
import 'package:dreamhome_architect/features/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 40,
              backgroundColor: Colors.greenAccent,
              child: Icon(Icons.person, size: 40, color: Colors.black)),
          SizedBox(height: 10),
          Text("Coffeestories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("mark.brock@icloud.com", style: TextStyle(color: Colors.grey)),
          Text("License no : 12345-  RG",
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: () {},
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "View License",
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("settings",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          ListTile(
              leading: Icon(Icons.password, color: Colors.black),
              title: Text("Change Password"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ChangePasswordDialog(),
                );
              }),
          ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                "Sign Out",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: "SIGN OUT",
                    content: const Text(
                      "Are you sure you want to Sign Out? Clicking 'Sign Out' will end your current session and require you to sign in again to access your account.",
                    ),
                    primaryButton: "SIGN OUT",
                    onPrimaryPressed: () {
                      Supabase.instance.client.auth.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninScreen(),
                          ),
                          (route) => false);
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
