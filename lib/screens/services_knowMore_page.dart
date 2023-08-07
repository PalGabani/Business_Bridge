import 'package:business_bridge/models/knowmore.dart';
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(
                    'Details :',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title1,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step1 in kn.title1des)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Text(
                  step1,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15),
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title2,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step2 in kn.title2des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step2,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title3,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step3 in kn.title3des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step3,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title4,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step4 in kn.title4des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step4,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title5,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step5 in kn.title5des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step5,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title6,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step6 in kn.title6des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step6,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title7,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step7 in kn.title7des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step7,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title8,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step8 in kn.title8des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step8,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title9,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step9 in kn.title9des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step9,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title10,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step10 in kn.title10des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step10,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 15),
                  ),
                ),

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8),
                  child: Text(kn.title11,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),),
                ),
              ),
              for (final step11 in kn.title11des)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    step11,
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
