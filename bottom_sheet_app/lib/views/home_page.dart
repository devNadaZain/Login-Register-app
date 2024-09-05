import 'package:flutter/material.dart';

import '../widgets/create_account_bpttom_sheet.dart';
import '../widgets/login_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050522),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/Illustration Picture.png'),
            ),
            SizedBox(height: 15),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF5858),
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.only(top: 16, bottom: 60),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6D6D7D),
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFDE69),
                fixedSize: Size(281, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Color(0xFFFFECAA),
                  isScrollControlled: true,
                  scrollControlDisabledMaxHeightRatio: 1.5,
                  context: context,
                  builder: (context) => CreateAccountBottomSheet(),
                );
              },
              child: Text('Create Account',
                  style: TextStyle(color: Color(0xFF050522), fontSize: 20)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(281, 60),
                side: BorderSide(color: Color(0xFFFFDE69), width: 2),
                backgroundColor: Color(0xFF050522),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Color(0xFFFFECAA),
                  context: context,
                  builder: (context) => LoginBottomSheet(),
                );
              },
              child: Text('Login',
                  style: TextStyle(color: Color(0xFFFFDE69), fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
