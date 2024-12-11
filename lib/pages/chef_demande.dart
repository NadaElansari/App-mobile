import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefDemande extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF9C5A46)),
          onPressed: () {
            Navigator.pushNamed(context, '/profile_chef');
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_t_3.png',
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Demandes',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xFF9C5A46),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('demandes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var demandes = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: demandes.length,
            itemBuilder: (context, index) {
              var demande = demandes[index];
              var data = demande.data() as Map<String, dynamic>;

              var allergies = data.containsKey('allergies') ? data['allergies'] : 'Unknown allergies';
              var date = data.containsKey('date') ? data['date'] : 'Unknown date';
              var demandeName = data.containsKey('demande') ? data['demande'] : 'Unknown demande';

              return Container(
                key: UniqueKey(),
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            demandeName,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF9C5A46),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Allergies: $allergies',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.5,
                              color: Color(0xFF9C5A46),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Date: $date',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.5,
                              color: Color(0xFF9C5A46),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9C5A46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('demandes')
                            .doc(demande.id)
                            .delete();
                      },
                      child: Text(
                        'Accepter',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}