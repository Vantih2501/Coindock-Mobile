import 'package:coindock_app/screens/main/search.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DetailAppbar({
    super.key,
    required this.title,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
