import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/news_date_formatter.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardNewsTitle extends StatelessWidget {
  final News data;
  const CardNewsTitle({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () async {
        final url = data.url;
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      },
      child: SizedBox(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16), 
                  child: Image.network(data.urlToImage!, fit: BoxFit.cover)
                )
              ),
            ),
            SizedBox(height: 12),
            Text(
              data.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.dark
              )
            ),
            SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  Expanded(child: Text(formatDate(data.publishedAt), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 14))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}