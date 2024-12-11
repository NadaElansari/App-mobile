import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class AjouterPlat extends StatefulWidget {
  @override
  _AjouterPlatState createState() => _AjouterPlatState();
}

class _AjouterPlatState extends State<AjouterPlat> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _savePlat() async {
    final String name = _nameController.text;
    final String price = _priceController.text;

    if (_image == null || name.isEmpty || price.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields and select an image')),
      );
      return;
    }

    try {
      final imageName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = FirebaseStorage.instance.ref().child('images/$imageName');
      final uploadTask = storageRef.putFile(_image!);
      final imageUrl = await (await uploadTask).ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('categories').add({
        'image': imageUrl,
        'name': name,
        'prix': price,
      });

      Navigator.pushNamed(context, '/profile_chef');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save plat')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 36),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9C5A46),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(41.2, 25.9, 0, 24.9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Retour',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              height: 1,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0.1, 0, 2.1),
                          child: Text(
                            'Ajouter un plat',
                            style: GoogleFonts.getFont(
                              'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              height: 1,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        SizedBox(width: 11.5),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(41, 0, 41, 11),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Image',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(28, 0, 29, 36),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: _image == null
                        ? Center(child: Text('Tap to pick an image'))
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(41, 0, 41, 11),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nom du plat',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(28, 0, 29, 36),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Ajouter le nom du plat',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(41, 0, 41, 11),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Prix',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(28, 0, 29, 36),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintText: 'Ajouter le prix',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _savePlat,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 33, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment(0.825, 0.018),
                        end: Alignment(-8.212, 0.018),
                        colors: <Color>[Color(0xFF9C5A46), Color(0x001F2937)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            height: 1,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}