import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EffectuerDemande extends StatefulWidget {
  @override
  _EffectuerDemandeState createState() => _EffectuerDemandeState();
}

class _EffectuerDemandeState extends State<EffectuerDemande> {
  TextEditingController _demandeController = TextEditingController();
  TextEditingController _allergiesController = TextEditingController();
  DateTime? _selectedDate;
  RangeValues _priceRange = RangeValues(0, 1000); // Initial range values

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _submitData() async {
    if (_demandeController.text.isEmpty ||
        _allergiesController.text.isEmpty ||
        _selectedDate == null ||
        _priceRange.start == 0 && _priceRange.end == 0) {
      // Handle empty fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
      return;
    }

    // Add data to Firestore
    await FirebaseFirestore.instance.collection('demandes').add({
      'demande': _demandeController.text,
      'allergies': _allergiesController.text,
      'date': _selectedDate?.toIso8601String(),
      'prix': {'min': _priceRange.start, 'max': _priceRange.end},
    });

    // Clear the fields after submission
    _demandeController.clear();
    _allergiesController.clear();
    setState(() {
      _selectedDate = null;
      _priceRange = RangeValues(0, 1000); // Reset range values
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Demande soumise avec succès.')),
    );

    // Navigate back to home page
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFECEBEB),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 45),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(13.2, 4, 5, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 20.9, 0, 21.9),
                              child: Text(
                                'Retour',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFF9C5A46),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                                  child: Container(
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
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 11, 0, 14),
                                  child: Text(
                                    'Demande',
                                    style: GoogleFonts.getFont(
                                      'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      height: 1,
                                      color: Color(0xFF9C5A46),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 71,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Positioned(
                              right: -6.2,
                              top: -11.4,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'EMPTY',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 83.4,
                                  height: 76.4,
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
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 27),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Ajouter Votre demande',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextField(
                      controller: _demandeController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Avez-vous des allergies?',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextField(
                      controller: _allergiesController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 33.9, 28),
                  child: Text(
                    'Entrer la date pour votre demande',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(13, 0, 16.3, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 6, 8.5, 7.8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF9C5A46),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: 42.5,
                              height: 46.2,
                              padding: EdgeInsets.fromLTRB(13.5, 14.7, 12.8, 13.9),
                              child: Container(
                                width: 16.2,
                                height: 17.6,
                                child: SizedBox(
                                  width: 16.2,
                                  height: 17.6,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_89_x2.svg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD3C7B8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _selectedDate != null
                                  ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                                  : 'Sélectionner une date',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Prix: ',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Color(0xFF000000),
                              ),
                            ),
                            Text(
                              '(${_priceRange.start.round()} - ${_priceRange.end.round()})',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        RangeSlider(
                          values: _priceRange,
                          min: 0,
                          max: 1000,
                          divisions: 100,
                          labels: RangeLabels(
                            _priceRange.start.round().toString(),
                            _priceRange.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _priceRange = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 39),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: _submitData,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9C5A46),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 288,
                          height: 42,
                          alignment: Alignment.center,
                          child: Text(
                            'Publier',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 2.5,
                              letterSpacing: 0.4,
                              color: Color(0xFFFFFFFF),
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
        ),
      ),
    );
  }
}