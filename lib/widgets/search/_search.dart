import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:flutter/material.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.light,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: InputBorder.none,   
                hintText: 'Search',
                prefixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.black54,)),
              ),
            ),
          )  ;
  }
}