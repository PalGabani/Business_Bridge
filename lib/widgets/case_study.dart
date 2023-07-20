
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import '../models/case_study.dart';
class caseItem extends StatelessWidget {
  const caseItem({super.key,required this.caseSt,required this.onSelectCase});

  final case_Study caseSt;

  final void Function(case_Study caseSt) onSelectCase;



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation:  3,
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.white,

      child: InkWell(
        onTap: () {
          onSelectCase(caseSt);
        },
        child: Stack(
          children: [
            Hero(
              tag: caseSt.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage(caseSt.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        caseSt.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
