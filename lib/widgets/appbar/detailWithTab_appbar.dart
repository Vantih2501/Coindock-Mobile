import 'package:coindock_app/screens/main/search.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DetailAppbarWithTab extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Tab> tabs;

  const DetailAppbarWithTab({
    super.key,
    required this.title,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(
          color: Color.fromARGB(15, 0, 0, 0),
          width: 1,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(LucideIcons.arrowLeft),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
        ),
      ],
      bottom: TabBar(
        indicatorColor: Colors.blue,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48); // Tinggi AppBar + tinggi TabBar
}
