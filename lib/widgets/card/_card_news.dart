import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/news_date_formatter.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final News data;

  const NewsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = data.url;
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80, 
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(data.urlToImage!, fit: BoxFit.cover),
              )
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 136,
                  child: Text(
                    data.title, 
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14 ,
                      fontWeight: FontWeight.w500, 
                      color: AppColors.dark
                    )),
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 136,
                  child: Text(
                    '${data.author} - ${formatDate(data.publishedAt)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, 
                    style: TextStyle(
                      color: AppColors.text100
                    )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}