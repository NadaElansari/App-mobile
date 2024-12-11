import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plat_details.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCategorie extends StatefulWidget {
  @override
  _SearchCategorieState createState() => _SearchCategorieState();
}

class _SearchCategorieState extends State<SearchCategorie> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF9C5A46),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(7, 15, 7, 25),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Text(
                              'Retour',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'assets/images/logo_t_3.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Plats',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 70), // Espace pour équilibrer la mise en page
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(19, 16, 21, 16),
              child: Text(
                'Choisissez Votre Plat',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(14, 8, 15, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 19),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8, 14, 0, 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    'assets/vectors/search_2_x2.svg',
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search by keys...',
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          searchQuery = value;
                                        });
                                      },
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var categories = snapshot.data!.docs.where((doc) =>
                            doc['name'].toString().toLowerCase().contains(searchQuery.toLowerCase()));
                        if (categories.isEmpty) {
                          return Center(child: Text('No categories found.'));
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            var category = categories.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlatDetails(platId: category.id),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 100, // Réduire la hauteur
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD9D9D9),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(category['image']),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft: Radius.circular(15),
                                                ),
                                              ),
                                              width: 100, // Garder la même taille
                                              height: double.infinity,
                                            ),
                                            Expanded(
                                              child: Center( // Centrer le contenu verticalement
                                                child: Padding(
                                                  padding: EdgeInsets.all(12),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center, // Centrer horizontalement
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        category['name'],
                                                        textAlign: TextAlign.center, // Centrer le texte
                                                        style: GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontWeight: FontWeight.bold, // Texte plus gras
                                                          fontSize: 20,
                                                          color: Color(0xFF000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 12),
                                              child: Icon(Icons.arrow_forward_ios, color: Color(0xFF9C5A46)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
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
