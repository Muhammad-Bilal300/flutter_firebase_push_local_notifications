import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';
import 'data_source.dart';
import 'list_item.dart';

class ListScreen extends StatelessWidget {
  final DataSource _dataSource = DataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Animation',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder<List<String>>(
        initialData: [],
        future: _dataSource.getCountriesFuture(),
        builder: (context, AsyncSnapshot snapshot) {
          final List<String> countries = snapshot.data;
          return LiveList(
            itemCount: countries.length,
            itemBuilder: (context, index, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(animation),
                  child: ListItem(
                    title: _dataSource,
                    onPressed: () {
                      _dataSource.getCountriesFuture();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
