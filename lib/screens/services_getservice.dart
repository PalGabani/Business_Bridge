import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/models/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class services_details_page extends ConsumerWidget {
  const services_details_page({
    super.key,
    required this.sr,
  });

  final Services sr;

  // final void Function(Meal meal) onToggleFavorite;

//

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(
        title: Text(sr.title),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                tag: sr.id,
                child: Container(


                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Details:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              for (final step in sr.details)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15
                    ),
                  ),
                ),
              const SizedBox(
                height: 17,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
