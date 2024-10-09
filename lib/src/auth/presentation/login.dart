import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final AuthorizationServiceConfiguration authorizationService = const AuthorizationServiceConfiguration(
  //     authorizationEndpoint: 'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/auth',
  //     tokenEndpoint: 'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/token'
  // );
  //
  // bool _isLoading = false;
  // String _accessToken = '';
  // final FlutterAppAuth _appAuth = const FlutterAppAuth();
  //
  // Future<void> login() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try {
  //
  //     final AuthorizationTokenResponse response = await _appAuth.authorizeAndExchangeCode(
  //         AuthorizationTokenRequest(
  //             'angolar_test', '/home',
  //             serviceConfiguration: authorizationService,
  //             scopes: ['openid', 'profile', 'email']
  //         )
  //     );
  //     print('resp $response');
  //
  //     // Stocker le token de manière sécurisée
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('access_token', response.accessToken!);
  //
  //     setState(() {
  //       _accessToken = response.accessToken!;
  //       _isLoading = false;
  //     });
  //     print('token $_accessToken');
  //     // Naviguer vers la page d'accueil après connexion réussie
  //     Navigator.pushNamed(context, '/home');
  //   } catch (e) {
  //     // Gérer les erreurs
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print(e);
  //   }
  // }

  final AuthorizationServiceConfiguration _authorizationService =
      const AuthorizationServiceConfiguration(
    authorizationEndpoint:
        'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/auth',
    tokenEndpoint:
        'https://sso.bitkap.africa/realms/bitkap_dev/protocol/openid-connect/token',
  );

  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  bool _isAuthenticated = false;
  String? _accessToken;

  bool get isAuthenticated => _isAuthenticated;
  String? get accessToken => _accessToken;

  Future<void> login() async {
    try {
      final AuthorizationTokenResponse response =
          await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          'angolar_test',
          '/home',
          serviceConfiguration: _authorizationService,
          scopes: ['openid', 'profile', 'email'],
        ),
      );

      // Store the access token securely
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', response.accessToken!);

      _isAuthenticated = true;
      _accessToken = response.accessToken!;
    } catch (e) {
      // Handle errors gracefully
      print('Login error: $e');
      _isAuthenticated = false;
      _accessToken = null;
    }
  }

  Future<void> _loginButtonPressed() async {
    try {
      await login();
    } catch (e) {
      print('Login error: $e');
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
            child: _isAuthenticated
                    ? CircularProgressIndicator()
                    : ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(200, 50),
              ),
              onPressed: () async{
                await login();
              },
              child: Text(
                'Login to Keycloak',
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
