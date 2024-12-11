import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 9, 0, 0.5),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 24),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 334.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/logo_t_3.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 45,
                                height: 45,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
                              child: Text(
                                'User Options',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 33),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 34.2, 0),
                            child: SizedBox(
                              width: 102.5,
                              height: 128,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0.8, 1),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18.2),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/white.png',
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        width: 101.7,
                                        height: 127,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: SizedBox(
                                        width: 20.1,
                                        height: 25.1,
                                        child: SvgPicture.asset(
                                          'assets/vectors/ellipse_6_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 47.8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30.2),
                                  child: Text(
                                    'Dhyana',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'User',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
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
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 25, 50.6),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0.5,
                          top: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: 397.5,
                            height: 60.7,
                            child: SvgPicture.asset(
                              'assets/vectors/rectangle_11_x2.svg',
                            ),
                          ),
                        ),
                  SizedBox(
                          width: 398,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 23.8, 0, 12.9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Mes informations',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xFF9C5A46),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0.5, 0, 0.4),
                                  width: 13.7,
                                  height: 23.1,
                                  child: SizedBox(
                                    width: 13.7,
                                    height: 23.1,
                                    child: SvgPicture.asset(
                                      'assets/vectors/left_arrow_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 25, 54.6),
                    child: Stack(
                      children: [
                        Positioned(
                          left: -9,
                          right: 0.5,
                          top: -11.8,
                          bottom: -5.9,
                          child: SizedBox(
                            width: 397.5,
                            height: 60.7,
                            child: SvgPicture.asset(
                              'assets/vectors/rectangle_111_x2.svg',
                            ),
                          ),
                        ),
                  SizedBox(
                          width: 398,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(9, 11.8, 0, 5.9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 41.3, 0),
                                      child: SizedBox(
                                        width: 49,
                                        height: 43,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_74_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 12, 0, 7),
                                      child: Text(
                                        'Payment ',
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Color(0xFF9C5A46),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 12.5, 0, 7.4),
                                  width: 13.7,
                                  height: 23.1,
                                  child: SizedBox(
                                    width: 13.7,
                                    height: 23.1,
                                    child: SvgPicture.asset(
                                      'assets/vectors/left_arrow_1_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(21.1, 0, 25.5, 57.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 184.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 2.1, 0, 0),
                                width: 37.8,
                                height: 28.5,
                                child: SizedBox(
                                  width: 37.8,
                                  height: 28.5,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_65_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6.6),
                                child: Text(
                                  'My Cards',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xFF9C5A46),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 3.7, 0, 3.8),
                          width: 13.7,
                          height: 23.1,
                          child: SizedBox(
                            width: 13.7,
                            height: 23.1,
                            child: SvgPicture.asset(
                              'assets/vectors/left_arrow_7_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(22, 0, 25, 42.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 209.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                    Positioned(
                                      right: -6.9,
                                      top: 0,
                                      child: SizedBox(
                                        width: 46.8,
                                        height: 36.4,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_4_x2.svg',
                                        ),
                                      ),
                                    ),
                              Container(
                                    width: 39.9,
                                    height: 36.4,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 12.4),
                                child: Text(
                                  'Promotions',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xFF9C5A46),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 9.2),
                          width: 13.7,
                          height: 23.1,
                          child: SizedBox(
                            width: 13.7,
                            height: 23.1,
                            child: SvgPicture.asset(
                              'assets/vectors/left_arrow_2_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(26, 0, 25, 50.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0.3, 0, 0),
                          width: 36.7,
                          height: 38.6,
                          child: SizedBox(
                            width: 36.7,
                            height: 38.6,
                            child: SvgPicture.asset(
                              'assets/vectors/bell_531_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 14.9),
                          child: Text(
                            'F.A.Q.',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xFF9C5A46),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 1, 0, 14.8),
                          width: 13.7,
                          height: 23.1,
                          child: SizedBox(
                            width: 13.7,
                            height: 23.1,
                            child: SvgPicture.asset(
                              'assets/vectors/left_arrow_3_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 49),
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF9C5A46)),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 19.5, 0),
                          child: SizedBox(
                            width: 269,
                            child: Text(
                              'Sign out',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                color: Color(0xFF9C5A46),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 12.7, 0, 2.8),
                          width: 38.7,
                          height: 23.5,
                          child: SizedBox(
                            width: 38.7,
                            height: 23.5,
                            child: SvgPicture.asset(
                              'assets/vectors/logout_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFBDC5CD),
                        ),
                        child: Container(
                          width: 430,
                          height: 0.5,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(31, 14.5, 35, 36.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF9C5A46),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.fromLTRB(6, 6, 6, 5.2),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20.8,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE8E8E8),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.fromLTRB(5, 8, 7, 5),
                                  child: SizedBox(
                                    width: 20,
                                    height: 19,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_85_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE8E8E8),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.fromLTRB(6, 8, 7, 4),
                                  child: SizedBox(
                                    width: 19,
                                    height: 20,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_42_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE8E8E8),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.fromLTRB(7, 6, 5, 6),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_106_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE8E8E8),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.fromLTRB(5, 8, 7, 4),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_45_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16.5,
              top: 264.1,
              child: SizedBox(
                width: 31.8,
                height: 36.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6.3),
                      width: 31.8,
                      height: 24.3,
                      child: SizedBox(
                        width: 31.8,
                        height: 24.3,
                        child: SvgPicture.asset(
                          'assets/vectors/single_011_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12.2, 0, 10.5, 0),
                      child: SizedBox(
                        width: 9.1,
                        height: 6.3,
                        child: SvgPicture.asset(
                          'assets/vectors/ellipse_91_x2.svg',
                        ),
                      ),
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