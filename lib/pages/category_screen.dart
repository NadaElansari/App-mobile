import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final categories = snapshot.data!.docs;

          List<Widget> categoryWidgets = [];
          for (var category in categories) {
            final categoryName = category['name'];
            final categoryImage = category['image'];
            categoryWidgets.add(
              ListTile(
                leading: Image.network(
                  categoryImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
                title: Text(categoryName),
              ),
            );
          }

          return ListView(
            children: categoryWidgets,
          );
        },
      ),
    );
  }
}
