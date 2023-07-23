import 'package:business_bridge/models/case_study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class case_Study_details_page extends ConsumerWidget {
  const case_Study_details_page({
    super.key,
    required this.cs,
  });

  final case_Study cs;

  // final void Function(Meal meal) onToggleFavorite;

//

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(
        title: Text(cs.title),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                tag: cs.id,
                child: Container(

                  child: Image.asset(
                    cs.imageUrl,
                    height: 200,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ClientGoal:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              for (final step in cs.ClientGoal)
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
              Align(
                alignment: Alignment.centerLeft ,
                child: Text(
                  'Situation:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              for (final step in cs.Situation)
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Study:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              for (final step in cs.Study)
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
            ],
          ),
        ),
      ),
    );
  }
}
