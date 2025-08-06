import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ProfileAvatarStats extends StatelessWidget {
  const ProfileAvatarStats({super.key});

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.neutralGray3,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.labelColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Container(
            width: 99,
            height: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://api.builder.io/api/v1/image/assets/TEMP/b1599a79712527fb6f844a5f3da41cfab025b245?width=248',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Recipe', '4'),
                _buildStatColumn('Followers', '2.5M'),
                _buildStatColumn('Following', '259'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
