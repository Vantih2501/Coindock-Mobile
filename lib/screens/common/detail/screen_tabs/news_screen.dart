import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/widgets/card/_card_news.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: 197,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.light
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('Bicoin News', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark)), 
            ),
            // ListView.separated(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: 10,
            //   separatorBuilder: (context, index) => const SizedBox(height: 0),
            //   itemBuilder: (context, index) => NewsCard(),
            // ), 
          ]
        ),
      ],
    );
  }
}