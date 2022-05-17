import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      width: 20,
      height: 20,
      color: Colors.blue,
      child: Column(
        children: [
          Image.asset("assets/images/sprayground_logo_red.png", scale: 2),
          Text(user.email!),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Cerrar sesion")),
        ],
      ),
    );
  }
}
