import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/Plan de travail 2.png',
              height: 100,
              fit: BoxFit.fill,
            ),
            Row(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
                SizedBox(width: 5),
                Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 5),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MENU',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey.shade600,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      // Handle closing logic
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Plan de travail 40.png',
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Profil and preferences',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    // Handle profile and preferences navigation
                  },
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Plan de travail 39.png',
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Identity verification',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    // Handle identity verification navigation
                  },
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Plan de travail 42.png',
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Payment methods',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    // Handle payment methods navigation
                  },
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Plan de travail 41.png',
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Account Security',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    // Handle account security navigation
                  },
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/icons/Plan de travail 43.png',
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    // Handle logout logic
                  },
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms and conditions',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Privacy policy',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'V 1.0.0',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 4.0),
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0.0,
          child: Image.asset(
            'assets/icons/Plan de travail 1.png',
            fit: BoxFit.fill,
          ),
          onPressed: () => debugPrint('Add data'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/Plan de travail 5.png',
              height: 35,
              fit: BoxFit.fill,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(right: 50),
              child: Image.asset(
                'assets/icons/Plan de travail 6.png',
                height: 35,
                fit: BoxFit.fill,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(left: 50),
              child: Image.asset(
                'assets/icons/Plan de travail 7.png',
                height: 35,
                fit: BoxFit.fill,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.grey.shade600,
              size: 35,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
