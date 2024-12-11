import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'prix.dart'; // Import de la page de paiement

class PlatDetails extends StatelessWidget {
  final String platId;

  PlatDetails({required this.platId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return PlatDetailsView(
              nomPlat: platData['name'] ?? 'Nom non disponible',
              description: platData['description'] ?? 'Savourez une expérience authentique de la cuisine marocaine avec notre délicieux couscous aux 7 légumes et tfaya. Ce plat traditionnel est préparé avec amour, en combinant des grains de couscous légèrement épicés avec une généreuse portion de sept légumes frais, tels que carottes, courgettes, pois chiches, navets, poivrons, courges et tomates. La touche finale de ce festin est la tfaya, une garniture sucrée et caramélisée, composée d\'oignons confits, de raisins secs et d\'amandes grillées, qui apporte une explosion de saveurs exotiques à chaque bouchée. Offrant une fusion parfaite de douceur et d\'épices, notre couscous marocain est un véritable régal pour les sens. Commandez dès maintenant et laissez-vous transporter au cœur des saveurs envoûtantes du Maroc, livré directement chez vous pour une expérience culinaire inoubliable.',
              price: platData['price'] != null ? platData['price'].toDouble() : 0.0,
              imageUrl: platData['image'] ?? '',
              platId: platId, // Passez l'ID du plat à la vue pour la navigation
            );
          }
        },
      ),
    );
  }
}

class PlatDetailsView extends StatelessWidget {
  final String nomPlat;
  final String description;
  final double price;
  final String imageUrl;
  final String platId;

  PlatDetailsView({
    required this.nomPlat,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.platId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/vectors/polygon_1_stroke_x2.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Text(
                    'Details',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF9C5A46),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo_t_3.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        nomPlat,
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 296.3,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl.isNotEmpty ? imageUrl : 'https://via.placeholder.com/150'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Description:',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          description,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Price: \$${price.toStringAsFixed(2)}',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 21,
                            sigmaY: 21,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF9C5A46)),
                              borderRadius: BorderRadius.circular(11),
                              gradient: RadialGradient(
                                center: Alignment(-1, -1),
                                radius: 1.41,
                                colors: <Color>[
                                  Color(0x66FFFFFF),
                                  Color(0x00FFFFFF),
                                ],
                                stops: <double>[0, 1],
                              ),
                            ),
                            width: double.infinity,
                            height: 40,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PrixPage(platId: platId),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 30,
                                  child: Text(
                                    'Ajouter',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      height: 3.3,
                                      letterSpacing: 0.3,
                                      color: Color(0xFF9C5A46),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
