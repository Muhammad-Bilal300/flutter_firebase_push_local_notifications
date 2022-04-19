import 'package:abc_animations/data_source.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final DataSource title;
  final Function onPressed;
  ListItem({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffffffe4),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            title.getCountriesFuture(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
