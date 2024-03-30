import 'package:flutter/material.dart';

class PersonRecommended extends StatelessWidget {
  const PersonRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 58,
      height: 58,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(58),
      ),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
            image: AssetImage('assets/images/h1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
