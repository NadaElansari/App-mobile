import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  DocumentSnapshot? userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('chefs')
          .doc(currentUser.uid)
          .get();
      setState(() {
        user = currentUser;
        userData = userDoc;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue'),
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.signOut();
              // Rediriger vers la page de connexion après la déconnexion
            },
            child: Text(
              'LogOut',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(
                      userData!['image'],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bienvenue ${userData!['name']}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Ajouter un plat
                    },
                    child: Text('Ajouter un plat'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Voir les demandes
                    },
                    child: Text('Voir les demandes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Modifier les informations
                    },
                    child: Text('Modifier mes informations'),
                  ),
                  SizedBox(height: 32),
                  TextButton(
                    onPressed: () {
                      // Supprimer le compte
                    },
                    child: Text(
                      'Supprimer mon compte',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}