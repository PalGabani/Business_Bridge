import 'package:business_bridge/models/case_study.dart';
import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/widgets/get_services.dart';
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

    void _openOverlayScreen() {
      showModalBottomSheet(
        //useSafeArea: true,
        //isScrollControlled: true,
        context: context,
        builder: (cntx) => GetService(

        ),
      );
    }
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
              for (final step in sr.details)
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
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: 240,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      )),
                  // onPressed: () {
                  //   showBottomSheet(
                  //     context: context,
                  //
                  //     builder: (BuildContext context){
                  //       return SizedBox(
                  //         height: 100,
                  //         child: Column(
                  //           children: [
                  //
                  //           ],
                  //         ),
                  //       );
                  //     }
                  //   );
                  // },
                  onPressed: _openOverlayScreen,
                  child: Text(
                    'Get  IT',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
