import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/widgets/card/_card_news_title.dart';
import 'package:coindock_app/widgets/charts/line_charts.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  String activeButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            _priceInfo(),
            SizedBox(height: 12),
            LineChartCard(),
            _filterSection(),
            SizedBox(height: 32),
            _descriptionSection(),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bitcoin News', 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w600, 
                    color: AppColors.dark
                    )
                  ),
                SizedBox(height: 16),
                SizedBox(
                  height: 254,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardNewsTitle(),
                      SizedBox(width: 16),
                      CardNewsTitle(),
                      SizedBox(width: 16),
                      CardNewsTitle(),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: (){

          },
          child: const Text('Buy Coin', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white)),
        ),
      )
    );
  }

  Column _descriptionSection() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descrition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark 
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Ornare viverra arcu sed nunc ultrices vel ornare. Amet turpis nisl nisi egestas cras amet. Mus quisque pharetra ultrices nullam ornare aenean sem eget ac. Pellentesque at vivamus ac imperdiet pellentesque sit integer arcu. Sem habitant eu convallis nunc.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.text300 
                  ),
                )
              ],
            );
  }

  Container _filterSection() {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.light
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buttonFilter('1H'),
                  _buttonFilter('1D'),
                  _buttonFilter('1M'),
                  _buttonFilter('1Y'),
                  _buttonFilter('ALL'),
                ]
              )
            );
  }

  SizedBox _buttonFilter(String title) {
    bool isSelected = activeButton == title;

    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isSelected ? AppColors.primary : AppColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),  // Correct way to apply border radius
          ),
        ),
        onPressed: () {
          setState(() {
            activeButton = isSelected ? '' : title;
          });
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.text300
            ),
          ),
        ),
      ),
    );
  }

  Column _priceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bitcoin Price',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.text200)),
            SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$70,509.75',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.dark)),
            SizedBox(width: 12),
            Text('+ 1700.254 (9.77%)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green.shade400)),
          ],
        )
      ],
    );
  }
}