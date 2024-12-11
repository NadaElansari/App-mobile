import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ParcourirChef extends StatelessWidget {
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
                                'CHEFS',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 70), // Space to balance layout
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
                'Choisissez Votre Chef Personnel',
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
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/ellipse_16.png',
                                      width: 100,
                                      height: 104,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ramali',
                                  style: GoogleFonts.getFont(
                                    'Lobster',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/heart_1_x2.svg',
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/ellipse_7.png',
                                      width: 100,
                                      height: 104,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Khadija',
                                  style: GoogleFonts.getFont(
                                    'Lobster',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/heart_2_x2.svg',
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/ellipse_8.png',
                                      width: 100,
                                      height: 104,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Fatima-Zahra',
                                  style: GoogleFonts.getFont(
                                    'Lobster',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/heart_4_x2.svg',
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFFFFFF),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/ellipse_20.png',
                                      width: 100,
                                      height: 104,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Amine',
                                  style: GoogleFonts.getFont(
                                    'Lobster',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/heart_3_x2.svg',
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile_chef');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/ellipse_12.png',
                                        width: 100,
                                        height: 104,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Nada',
                                    style: GoogleFonts.getFont(
                                      'Lobster',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 18,
                                    child: SvgPicture.asset(
                                      'assets/vectors/heart_x2.svg',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile_chef');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/ellipse_17.png',
                                        width: 100,
                                        height: 104,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ayoub',
                                    style: GoogleFonts.getFont(
                                      'Lobster',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 18,
                                    child: SvgPicture.asset(
                                      'assets/vectors/heart_1_x2.svg',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
