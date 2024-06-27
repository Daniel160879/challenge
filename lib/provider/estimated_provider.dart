import 'package:challenge/data/name_age_repository.dart';
import 'package:challenge/domain/estimated_age.dart';
import 'package:flutter/material.dart';

class EstimatedProvider extends ChangeNotifier {
  final NameAgeRepository _nameAgeRepository;
  EstimatedAge? estimatedAge;

  EstimatedProvider(this._nameAgeRepository);

  Future<void> sendNameGetAge(String name) async {
    estimatedAge = await _nameAgeRepository.getEstimatedAge(name);
    notifyListeners();
  }
}
