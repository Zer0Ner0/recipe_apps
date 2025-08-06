import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ProfileBioSection extends StatelessWidget {
  const ProfileBioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Afuwape Abiodun',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.labelColor,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Chef',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.neutralGray3,
            ),
          ),
          const SizedBox(height: 22),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Private Chef\nPassionate about food and life 😊🍲🍝🍱\n',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF797979),
                  ),
                ),
                TextSpan(
                  text: 'More...',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryGreen80,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
