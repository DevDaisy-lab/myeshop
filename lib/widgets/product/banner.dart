import 'package:flutter/material.dart';

class Bannerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle3 = Theme.of(context).textTheme.headline3;
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/banner1.png',
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Special Offers',
                style: textStyle3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
