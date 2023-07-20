import 'package:business_bridge/data/dummy_data.dart';
import 'package:business_bridge/provider/casse_provider.dart';
import 'package:riverpod/riverpod.dart';

final caseStudyProvider=Provider((ref) {
  return dummyMeals;
});