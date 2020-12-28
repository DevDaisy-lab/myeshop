import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpecProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //scrollDirection: Axis.horizontal,
      children: [
        SizedBox(height: 5.0),
        CarouselSlider(
          height: 170.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.7,
          items: [
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/specprod4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/specprod6.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/specprod3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(5.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/specprod5.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
