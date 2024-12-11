import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfo extends StatefulWidget {
  final String userId;

  UserInfo({required this.userId});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('chefs').doc(widget.userId).get();
    if (userDoc.exists) {
      var userData = userDoc.data() as Map<String, dynamic>;
      setState(() {
        _usernameController.text = userData['username'] ?? 'Unknown';
        _firstNameController.text = userData['first name'] ?? 'Unknown';
        _lastNameController.text = userData['last name'] ?? 'Unknown';
        _imageUrl = userData['image'] ?? '';
      });
    }
  }

  Future<void> _updateUserData() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('chefs').doc(widget.userId).update({
        'username': _usernameController.text,
        'first name': _firstNameController.text,
        'last name': _lastNameController.text,
        // Add any other fields you want to update
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Information updated')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF9C5A46)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Mes informations',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Color(0xFF000000),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _imageUrl.isEmpty && _usernameController.text.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _imageUrl.isNotEmpty
                        ? Image.network(
                            _imageUrl,
                            height: 133.3,
                            width: 133.3,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 133.3,
                            width: 133.3,
                            color: Colors.grey,
                            child: Icon(Icons.person, size: 50, color: Colors.white),
                          ),
                  ),
                  SizedBox(height: 40),
                  _buildTextField('Username', _usernameController),
                  SizedBox(height: 52),
                  _buildTextField('First name', _firstNameController),
                  SizedBox(height: 52),
                  _buildTextField('Last name', _lastNameController),
                  SizedBox(height: 84),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF2B47FC), backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    ),
                    onPressed: _updateUserData,
                    child: Text(
                      'Modifier',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0xFF9C5A46),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9C5A46)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9C5A46)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9C5A46)),
            ),
          ),
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF9C5A46),
          ),
        ),
      ],
    );
  }
}