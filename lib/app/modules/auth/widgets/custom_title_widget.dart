import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Image.asset(
            'assets/icons/twitter-white-logo.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 20),
          const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Happy Tweeting',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
