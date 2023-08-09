import 'package:business_bridge/data/dummy_data.dart';
import 'package:business_bridge/provider/casse_provider.dart';
import 'package:riverpod/riverpod.dart';

final servicesProvider=Provider((ref) {
  return dummyData_services;
});

final caseStudyProvider=Provider((ref) {
  return dummyCase;
});

final knowMoreProvider=Provider((ref) {
  return knowMoreData;
});
final assignprojectdetailProvider=Provider((ref) {
  return assignprojectdetails;
});
final assignedprojectsProvider=Provider((ref) {
  return assignedprojects;
});