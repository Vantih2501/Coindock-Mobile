import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: Image.asset('assets/logos/coin-dock-splash-logo.png').image, width: 94, height: 30),
          const SizedBox(height: 24),
          Container(
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
          )  
        ],
      ),
    );
  }
}