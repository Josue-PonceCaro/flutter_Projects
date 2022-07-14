import 'package:app3/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [
           ListTile(
            title: const Text('This is a title'),
            leading: Icon(Icons.calendar_view_day_rounded, color: AppTheme.primaryColor,),
            subtitle: const Text('Nostrud veniam tempor consequat esse proident. Elit et proident excepteur labore.'),
          ),
          Row()
        ],
      ),
    );
  }
}