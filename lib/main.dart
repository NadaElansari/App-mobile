import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/pages/home.dart';

import 'package:flutter_app/pages/ajouter_plat.dart';

import 'package:flutter_app/pages/chef_demande.dart';
import 'package:flutter_app/pages/create_account.dart';
import 'package:flutter_app/pages/effectuer_demande.dart';


import 'package:flutter_app/pages/page_garde.dart';
import 'package:flutter_app/pages/parcourir_chef.dart';

import 'package:flutter_app/pages/plat_details.dart';
import 'package:flutter_app/pages/profile_chef.dart';
import 'package:flutter_app/pages/rating_chef.dart';
import 'package:flutter_app/pages/search_categorie.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:flutter_app/pages/user_info.dart';

import 'package:flutter_app/pages/user_options.dart';
import 'package:flutter_app/pages/category_screen.dart';
import 'package:flutter_app/pages/chefpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/page_garde',
      routes: {
        '/home': (context) => Home(),
        
        
        '/ajouter_plat': (context) => AjouterPlat(),
        '/chef_demande': (context) => ChefDemande(),
        '/create_account': (context) => CreateAccount(),
        '/effectuer_demande': (context) => EffectuerDemande(),
        
        
        '/page_garde': (context) => PageGarde(),
        '/parcourir_chef': (context) => ParcourirChef(),
        
        '/plat_details': (context) => PlatDetails(platId: 'plat.Id'),
        '/profile_chef': (context) => ChefPage(),
        '/rating_chef': (context) => RatingChef(),
        '/search_categorie': (context) => SearchCategorie(),
        '/sign_in': (context) => SignIn(),
        '/user_info': (context) => UserInfo(userId: 'Amine'), // Pass the userId here
        
        '/user_options': (context) => UserOptions(),
        '/categories': (context) => CategoryScreen(),
        
      },
    );
  }
}