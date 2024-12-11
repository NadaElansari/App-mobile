import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = "";
  String selectedLocation = "Rabat, Maroc";
  final List<String> locations = [
    "Rabat, Maroc",
    "Casablanca, Maroc",
    "Marrakech, Maroc",
    "Fes, Maroc",
    "Tangier, Maroc"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
            ),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Image.asset(
                          'assets/images/logo_t_3.png',
                          height: 40,
                        ),
                      ),
                      Text(
                        'Bienvenue dans Tabakhi',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 0, 25, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 17, 0, 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    'assets/vectors/location_1_x2.svg',
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              DropdownButton<String>(
                                value: selectedLocation,
                                icon: Icon(Icons.arrow_downward, size: 16),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Color(0xFF333333)),
                                underline: Container(
                                  height: 2,
                                  color: Color(0xFF333333),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedLocation = newValue!;
                                  });
                                },
                                items: locations.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('EMPTY'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 3, 56),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 331,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 29, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: SizedBox(
                                width: 264,
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
                                          'assets/vectors/search_1_x2.svg',
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
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 0, 24, 49),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF9C5A46),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: -22,
                            child: SizedBox(
                              width: 327,
                              height: 175,
                              child: SvgPicture.asset(
                                'assets/vectors/mask_group_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(22, 22, 0, 23),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Makla dyal dar twslk tal dar',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        height: 1.3,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/effectuer_demande');
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(16, 4, 16.9, 4),
                                          child: Text(
                                            'Commander',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 2.7,
                                              color: Color(0xFF9C5A46),
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
                        ],
                      ),
                    ),
                  ),
                ),
                CategoriesWidget(searchQuery: searchQuery),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final String searchQuery;

  CategoriesWidget({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choisissez Votre Plat',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF333333),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search_categorie');
                },
                child: Text(
                  'View All',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF9C5A46),
                  ),
                ),
              ),
            ],
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('categories').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var categories = snapshot.data!.docs.where((doc) =>
                doc.data().containsKey('name') &&
                doc['name'].toString().toLowerCase().contains(searchQuery.toLowerCase()));
            return Container(
              margin: EdgeInsets.fromLTRB(24, 0, 0, 39),
              height: 130, // Adjusted height for category items
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  var category = categories.elementAt(index);
                  return buildCategoryItem(category['name'], category['image']);
                },
              ),
            );
          },
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 24), // Reduced bottom margin
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '    Choisissez Votre Chef Personnel',
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF333333),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/parcourir_chef');
                  },
                  child: Text(
                    'View All',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF9C5A46),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('chefs').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var chefs = snapshot.data!.docs.where((doc) =>
                doc.data().containsKey('name') &&
                doc['name'].toString().toLowerCase().contains(searchQuery.toLowerCase()));
            return Container(
              margin: EdgeInsets.fromLTRB(24, 0, 0, 39),
              height: 130, // Adjusted height for chef items
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chefs.length,
                itemBuilder: (context, index) {
                  var chef = chefs.elementAt(index);
                  return buildCategoryItem(chef['name'], chef['image']);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildCategoryItem(String title, String imagePath) {
    print('Category Image URL: $imagePath'); // Debug statement to log image URL

    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            height: 60,
            width: 60,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error); // Display an error icon if image fails to load
            },
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
