import 'package:business_bridge/models/services.dart';
import 'package:business_bridge/provider/data_provider.dart';
import 'package:business_bridge/widgets/get_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

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
    final String? na = sr.title;
    final ss = ref.watch(servicesProvider);

    return Scaffold(

      appBar: AppBar(
        backgroundColor:Color(0xffdee9f0),

        scrolledUnderElevation: 0,
        title: Text(sr.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Hero(
            //   tag: sr.id,
            //   child: Container(),
            // ),
            Hero(
              tag: sr.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(sr.bgimage),
                 fit: BoxFit.cover,
                // fadeOutCurve: Curves.bounceIn,
                // fadeOutDuration: Duration(microseconds: 1),
                 fadeInDuration:Duration(milliseconds: 100) ,
                height: 270,
                width: double.infinity,
              ),
            ),
           // Image.asset(sr.bgimage),
            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(image: AssetImage(sr.bgimage),
            //     fit: BoxFit.cover),
            //   ),
            // ),
            Container(
              height: 330,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      height: 5,
                    ),
                    for (final step1 in sr.types)
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
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10,top: 10),
              width: 240,
              height: 60,
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
                onPressed: () {
                  showModalBottomSheet(
                    //useSafeArea: true,
                    //isScrollControlled: true,
                    context: context,
                    builder: (cntx) => GetService(
                      sn: sr.title,
                    ),
                  );
                },
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
    );
  }
}
