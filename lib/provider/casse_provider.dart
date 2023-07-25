import 'package:business_bridge/provider/data_provider.dart';
import 'package:riverpod/riverpod.dart';

class caseProvider extends StateNotifier<Map> {
  caseProvider  ()
      : super({

  });


  final filtersProvider =
  StateNotifierProvider<caseProvider, Map>(
          (ref) => caseProvider());
}
final filtercaseProvider = Provider((ref) {
  final cases=ref.watch(caseStudyProvider );
  return cases.where((meal) {

    return true;
  }).toList();
});