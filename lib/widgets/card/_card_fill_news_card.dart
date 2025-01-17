import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/formater/news_date_formatter.dart';
import 'package:coindock_app/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FillNewsCard extends StatelessWidget {
  final News data;
  const FillNewsCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = data.url;
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        height: 220,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.light
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.network(
                data.urlToImage!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover
                ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.3
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis
                        ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        children: [
                          Expanded(child: Text('${data.author} - ${formatDate(data.publishedAt)}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withValues(alpha: 5), fontSize: 14))),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}