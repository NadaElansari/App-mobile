import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 29, 54),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add logout functionality here
                      },
                      child: Text(
                        'LogOut',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF9C5A46),
                        ),
                      ),
                    ),
                    Text(
                      'Bienvenue',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Container(
                      width: 53,
                      height: 48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/logo_t_3.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('chefs').doc('Amine').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var chefData = snapshot.data;
                  if (chefData == null || !chefData.exists) {
                    return Center(child: Text('No data available'));
                  }

                  var data = chefData.data() as Map<String, dynamic>?;

                  if (data == null) {
                    return Center(child: Text('No data available'));
                  }

                  return Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(data['image']), // Fetching the 'image' field
                        ),
                        SizedBox(height: 20),
                        Text(
                          data['name'], // Fetching the 'name' field
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildButton(
                context,
                'Ajouter un plat',
                () => Navigator.pushNamed(context, '/ajouter_plat'),
              ),
              _buildButton(
                context,
                'Voir les demandes',
                () => Navigator.pushNamed(context, '/chef_demande'),
              ),
              _buildButton(
                context,
                'Modifier mes informations',
                () => Navigator.pushNamed(context, '/user_info'),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Add delete account functionality here
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    width: 318,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Color(0xFF9C5A46),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Supprimer mon compte',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
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

  Widget _buildButton(BuildContext context, String text, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 24),
          child: Text(
            text,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }
}