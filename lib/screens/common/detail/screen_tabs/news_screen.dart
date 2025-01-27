import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:coindock_app/widgets/card/_card_news.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final Future<List<News>> listNews;
  final String coinName;

  const NewsScreen({super.key, required this.listNews, required this.coinName});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        //   height: 197,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
        //     color: AppColors.light
        //   ),
        // ),
        SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('$coinName News', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.dark)), 
            ),
            FutureBuilder<List<News>>(
              future: listNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final News news = snapshot.data![index];
                      return NewsCard(data: news);
                    },
                  ); 
                }
              },
            )
          ]
        ),
      ],
    );
  }
}