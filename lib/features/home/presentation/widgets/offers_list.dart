import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/containers/primary_container.dart';
import 'offers_card.dart';

// Modelo temporal para ofertas
class OfferModel {
  final String offerOn;
  final String amount;
  final Color color;

  OfferModel({
    required this.offerOn,
    required this.amount,
    required this.color,
  });
}

// Lista temporal de ofertas
final List<OfferModel> offerList = [
  OfferModel(
    offerOn: "Cleaning Services",
    amount: "20%",
    color: Colors.blue,
  ),
  OfferModel(
    offerOn: "Home Repair",
    amount: "15%",
    color: Colors.green,
  ),
  OfferModel(
    offerOn: "AC Repair",
    amount: "25%",
    color: Colors.orange,
  ),
];

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        height: 200.h,
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        child: CarouselSlider(
          options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              viewportFraction: 0.9,
              autoPlayAnimationDuration: const Duration(seconds: 2)),
          items: offerList.map((offer) {
            return Builder(
              builder: (BuildContext context) {
                return OffersCard(
                  offerOn: offer.offerOn,
                  amount: offer.amount,
                  color: offer.color,
                );
              },
            );
          }).toList(),
        ));
  }
}
