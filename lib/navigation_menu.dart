import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/screens/main/market.dart';
import 'package:coindock_app/screens/main/profile.dart';
import 'package:coindock_app/screens/main/news.dart';
import 'package:coindock_app/screens/main/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 33.0,
            shadowColor: Colors.black87,
            backgroundColor: Colors.white,
            indicatorColor: AppColors.primary.withOpacity(0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(LucideIcons.candlestickChart,size: 22,),label: 'Market'),
              NavigationDestination(icon: Icon(LucideIcons.search,size: 22,),label: 'Search'),
              NavigationDestination(icon: Icon(LucideIcons.newspaper,size: 22,),label: 'News'),
              NavigationDestination(icon: Icon(LucideIcons.user,size: 22,), label: 'Profile')
            ]
          ),
        ),
        body: Obx(() => controller.screen[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const MarketPage(),
    const SearchPage(),
    const NewsPage(),
    const ProfilePage(),
  ];
}