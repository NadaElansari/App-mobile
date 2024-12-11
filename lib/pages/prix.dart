import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrixPage extends StatelessWidget {
  final String platId;

  PrixPage({required this.platId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paiement',
          style: GoogleFonts.getFont(
            'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: Color(0xFF9C5A46),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('categories').doc(platId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Plat not found'));
          } else {
            var platData = snapshot.data!.data() as Map<String, dynamic>;
            String nomPlat = platData['name'] ?? 'Nom non disponible';
            double price = platData['price'] != null ? platData['price'].toDouble() : 0.0;

            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paiement pour:',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    nomPlat,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Prix: \$${price.toStringAsFixed(2)}',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Informations de paiement',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Numéro de carte',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nom sur la carte',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Date d\'expiration',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logique de paiement
                      },
                      child: Text(
                        'Procéder au paiement',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9C5A46),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
