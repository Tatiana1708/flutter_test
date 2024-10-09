import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthorizationServiceConfiguration authorizationService = const AuthorizationServiceConfiguration(
      authorizationEndpoint: 'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/auth',
      tokenEndpoint: 'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/token'
  );

  bool _isLoading = false;
  String _accessToken = '';
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    try {

      final AuthorizationTokenResponse response = await _appAuth.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
              'angolar_test', '/home',
              serviceConfiguration: authorizationService,
              scopes: ['openid', 'profile', 'email']
          )
      );


      // Stocker le token de manière sécurisée
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', response.accessToken!);

      setState(() {
        _accessToken = response.accessToken!;
        _isLoading = false;
      });

      // Naviguer vers la page d'accueil après connexion réussie
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      // Gérer les erreurs
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Image.asset(
              'assets/icons/Plan de travail 2.png',
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),),
                minimumSize: Size(200, 50),
              ),
              onPressed: () => login,
              child: Text('Login to Keycloak',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}