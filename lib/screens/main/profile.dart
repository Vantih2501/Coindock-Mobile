import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/service/_authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            user != null 
              ? _profileSection(user) 
              : Container(),
            SizedBox(height: 24),
            Column(
              children: [
                _authButton(
                  'Log In', 
                  AppColors.primary, 
                  Colors.white, 
                  '/login',
                  context,
                ),
                SizedBox(height: 12),
                _authButton(
                  'Create Account', 
                  Colors.white, 
                  AppColors.dark, 
                  border: true, 
                  '/register',
                  context
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width / 2 - 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border:Border.all(color: Colors.grey.shade100)
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width / 2 - 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border:Border.all(color: Colors.grey.shade100)
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Column(
              children: [
                _settingButton('Lorem'),
                SizedBox(height: 12),
                _settingButton('Ipsum'),
                SizedBox(height: 12),
                _settingButton('Ipsum'),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){
                      AuthService().logout();
                    }, 
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.dark.withValues(alpha: 0.1),
                      alignment: Alignment.centerLeft,
                      elevation: 0,
                      backgroundColor: AppColors.light,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: AppColors.dark,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(LucideIcons.chevronRight, color: AppColors.dark)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _settingButton(String title) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: (){}, 
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.dark.withValues(alpha: 0.1),
          alignment: Alignment.centerLeft,
          elevation: 0,
          backgroundColor: AppColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
            Spacer(),
            Icon(LucideIcons.chevronRight, color: AppColors.dark)
          ],
        ),
      ),
    );
  }

  SizedBox _authButton( 
    String title, 
    Color backgroundColor, 
    Color color,
    String url, 
    BuildContext context, 
    {bool border = false}) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, url),
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.dark.withValues(alpha: 0.1),
          alignment: Alignment.centerLeft,
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: border 
            ? BorderSide(color: Colors.grey.shade300, width: 1) 
            : BorderSide.none,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  Padding _profileSection(User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.light,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(44),
              child: Image.network(user.photoURL ?? 'https://cdn-icons-png.flaticon.com/512/149/149071.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   user.displayName ?? 'Hamdy Ganduls',
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w600,
              //     color: AppColors.dark
              //   ),
              // ),
              Text(
                user.email ?? '6KoGy@example.com',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.dark
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}