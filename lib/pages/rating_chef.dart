import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingChef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      padding: EdgeInsets.fromLTRB(0, 3, 0, 0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(19, 0, 5, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 4),
                  child: SizedBox(
                    width: 230.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 8, 9.5, 9),
                          child: SizedBox(
                            width: 159.9,
                            child: Text(
                              'Retour',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF9C5A46),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Avis',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/logo_t_3.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(1, 0, 1, 8),
            decoration: BoxDecoration(
              color: Color(0xFF9C5A46),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 11,
                  child: Container(
                    width: 423,
                    height: 34,
                    color: Color(0xB2000000),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 13, 19, 13),
                  child: Text(
                    'NomChef',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/blue.png'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Text(
                                    'Nom_User',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Avis',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 0, 31),
                        child: Text(
                          '1/5',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFFFC700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 332,
                  height: 1,
                  color: Color(0xFFE8E8E8),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(23, 0, 17, 170),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 27, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/blue.png'),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Text(
                                        'Nom_user',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Avis',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 277,
                            height: 1,
                            color: Color(0xFFE8E8E8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 57),
                  child: Text(
                    '1/5',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFFFFC700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(19, 0, 19, 22),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Ajouter un avis',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(31, 0, 40, 21),
            padding: EdgeInsets.fromLTRB(0, 43.2, 3.4, 63.8),
            child: Text(
              'Description',
              style: GoogleFonts.getFont(
                'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(19, 0, 19, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Donner une note sur 5',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(26, 0, 35, 42.1),
            child: Stack(
              children: [
                Positioned(
                  left: -28,
                  right: -28,
                  top: -11,
                  bottom: -8.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 369,
                      height: 33.9,
                      child: SvgPicture.asset(
                        'assets/vectors/background_1_x2.svg',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(28, 11, 28, 8.9),
                  child: Text(
                    '1/5',
                    style: GoogleFonts.getFont(
                      'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 57),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 288,
                height: 42,
                decoration: BoxDecoration(
                  color: Color(0xFF9C5A46),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Poster',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      height: 1.2,
                      letterSpacing: 0.3,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 430,
                height: 0.5,
                color: Color(0xFFBDC5CD),
              ),
              Container(
                color: Color(0xFFFAFAFA),
                padding: EdgeInsets.fromLTRB(31, 14.5, 35, 36.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFF9C5A46),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        'assets/vectors/vector_66_x2.svg',
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        'assets/vectors/vector_105_x2.svg',
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        'assets/vectors/vector_92_x2.svg',
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        'assets/vectors/vector_44_x2.svg',
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.all(6),
                      child: SvgPicture.asset(
                        'assets/vectors/vector_84_x2.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
