import 'package:challenge/app_widget.dart';
import 'package:challenge/data/name_age_repository.dart';
import 'package:challenge/provider/estimated_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  NameAgeRepository nameAgeRepository = NameAgeRepository();
  runApp(ChangeNotifierProvider(create: (context) => EstimatedProvider(nameAgeRepository), child: const MyApp()));
}
