import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/models/knowmore.dart';
import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/widgets/get_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class services_knowMore_page extends ConsumerWidget {
  const services_knowMore_page({
    super.key,
    required this.kn,
  });

  final knowMore kn;

  // final void Function(Meal meal) onToggleFavorite;

//

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(
        title: Text(kn.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                tag: kn.id,
                child: Container(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' Details :',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              for (final step in kn.details)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),
              const SizedBox(
                height: 17,
              ),
              Image.asset('assets/images/services/Frame 10.jpg'),
              const SizedBox(
                height: 100,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
