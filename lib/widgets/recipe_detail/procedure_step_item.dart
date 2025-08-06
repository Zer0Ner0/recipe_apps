import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/recipe_step.dart';

class ProcedureStepItem extends StatelessWidget {
  final RecipeStep step;

  const ProcedureStepItem({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.neutralGray4.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step ${step.stepNumber}',
                style: const TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                step.description,
                style: const TextStyle(
                  color: AppColors.neutralGray3,
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
