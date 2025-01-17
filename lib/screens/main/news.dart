import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/widgets/appbar/main_appbar.dart';
import 'package:coindock_app/widgets/card/_card_news.dart';
import 'package:coindock_app/widgets/card/_card_news_title.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBar(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 8),
                    _recentNews(),
                    SizedBox(height: 24),
                    _ourNews(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _recentNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Recent News', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )
          )
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 254,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardNewsTitle(),
              SizedBox(width: 16),
              CardNewsTitle(),
              SizedBox(width: 16),
              CardNewsTitle(),
              SizedBox(width: 16),
            ],
          ),
        )
      ],
    );
  }

  Column _ourNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Our News', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            color: AppColors.dark
            )
          )
        ),
        SizedBox(height: 8),
        // ListView(
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   children: [
        //     NewsCard(),
        //     NewsCard(),
        //     NewsCard(),
        //     NewsCard(),
        //   ],
        // )
      ],
    );
  }
}


