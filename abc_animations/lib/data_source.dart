import 'dart:async';

class DataSource {
  final List<String> _countries = [
    'Finland',
    'Australia',
    'India',
    'Chile',
    'Japan',
    'Indonesia',
    'Spain',
    'Canada',
    'Belarus',
    'Mongolia',
    'Sweden',
    'New Zealand',
    'Uruguay',
  ];

  List<String> getCountriesFuture() {
    return _countries;
  }
}
