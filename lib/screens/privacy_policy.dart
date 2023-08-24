import 'package:business_bridge/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class privacy_policy extends ConsumerStatefulWidget {
  @override
  ConsumerState<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends ConsumerState<privacy_policy> {
  List p = [
    {
      "title": "1. Information We Collect",
      "p1": "1.1 Personal Information:",
      "p1details":
          "When you use our App, we may collect personal information that can be used to identify you. Personal information may include your name, email address, phone number, and any other information you provide to us.",
      "p2": "1.2 Usage Data:",
      "p2details":
          "We may also collect usage data related to your interactions with the App. This may include information such as the pages you visit, the features you use, and other actions you perform.",
      "p3": "",
      "p3details": ""
    },
    {
      "title": "2. How We Use Your Information",
      "p1": "2.1 Provide and Maintain the App:",
      "p1details":
          "We may use your personal information to provide and maintain our App, communicate with you, and respond to your inquiries or requests.",
      "p2": "2.2 Improve the App:",
      "p2details":
          "We may use usage data to understand how users interact with our App, identify areas for improvement, and enhance the user experience.",
      "p3": "2.3 Marketing and Promotion:",
      "p3details":
          "With your consent, we may use your personal information to send you promotional materials, newsletters, and other marketing communications. You can opt-out of receiving these communications at any time."
    },
    {
      "title": "3. Data Sharing and Disclosure ",
      "p1": "3.1 Service Providers:",
      "p1details":
          "We may share your personal information with third-party service providers who help us in operating our business, providing the App, or delivering services to you. These service providers are bound by confidentiality agreements and are prohibited from using your personal information for any other purposes.",
      "p2": "3.2 Legal Requirements:",
      "p2details":
          "We may access, preserve, and disclose your personal information if required to do so by law, court order, or governmental authority, or if we believe that such action is necessary to comply with applicable laws and regulations or protect our rights, property, or safety.",
      "p3": "3.3 Business Transfers:",
      "p3details":
          "In the event of a merger, acquisition, or sale of all or a portion of our business, your personal information may be transferred to the acquiring entity or third party involved. We will provide notice before your personal information becomes subject to a different privacy policy."
    },
    {
      "title": "4. Data Security",
      "p1": "",
      "p1details":
          "We implement reasonable security measures to protect your personal information against unauthorized access, loss, or alteration. However, please note that no method of transmission or storage is completely secure, and we cannot guarantee the absolute security of your personal information.",
      "p2": "",
      "p2details": "",
      "p3": "",
      "p3details": ""
    },
    {
      "title": "5. Children's Privacy",
      "p1": "",
      "p1details":
          "Our App is not intended for use by individuals under the age of 16. We do not knowingly collect personal information from children under the age of 16. If you become aware that a child has provided us with personal information without parental consent, please contact us, and we will take steps to remove the information and terminate the child's account.",
      "p2": "",
      "p2details": "",
      "p3": "",
      "p3details": ""
    },
    {
      "title": "6. Changes to this Privacy Policy",
      "p1": "",
      "p1details":
          "We may update this Privacy Policy from time to time to reflect changes in our practices or legal obligations. We will notify you of any material changes by posting the revised Privacy Policy on our website or through other communication channels.",
      "p2": "",
      "p2details": "",
      "p3": "",
      "p3details": ""
    },
    {
      "title": "7. Contact Us",
      "p1": "",
      "p1details":
          "If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at www.business_bridge.com.",
      "p2": "",
      "p2details": "",
      "p3": "",
      "p3details": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy policy"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in p)
              Padding(
                padding: EdgeInsets.only(left: 5,right: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.only(left: 12, top: 8),
                        child: Text(item["title"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      ),

                      if (item["p1"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12, top: 8),
                          child: Text(item["p1"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                      if (item["p1details"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(item["p1details"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                              )),
                        ),

                      if (item["p2"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12, top: 8),
                          child: Text(item["p2"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                      if (item["p2details"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(item["p2details"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                              )),
                        ),

                      if (item["p3"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12, top: 8),
                          child: Text(item["p3"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                      if (item["p3details"].toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(item["p3details"],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                              )),
                        ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),

        // child: Column(
        //   children: [
        //     Text("")
        //   ],
        //),
      ),
    );
  }
}
