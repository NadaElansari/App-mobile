import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageGarde extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_6.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x8F2C2828),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tabbakhi_12.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/create_account');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Color(0xFF9C5A46),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Create an account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sign_in');
                  },
                  child: Column(
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Click here.',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white,
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
    );
  }
}