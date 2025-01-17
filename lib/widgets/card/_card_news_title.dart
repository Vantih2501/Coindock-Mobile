import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:flutter/material.dart';

class CardNewsTitle extends StatelessWidget {
  const CardNewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 56,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.light
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'HYPE, BGB and MOVE rally in double-digits, Bitcoin crash does not fade gains',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.dark
            )
          ),
          SizedBox(height: 4),
            Text(
              'crypto.news - 7 Days ago', 
              maxLines: 1,
              style: TextStyle(
                color: AppColors.text100
            )
          ),
        ],
      ),
    );
  }
}