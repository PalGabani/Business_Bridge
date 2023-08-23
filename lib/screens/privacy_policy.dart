import 'package:business_bridge/models/policy.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class privacy_policy extends ConsumerStatefulWidget{

  @override
  ConsumerState<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends ConsumerState<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    final policies = ref.watch(policyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy policy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}