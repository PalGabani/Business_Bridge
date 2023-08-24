import 'package:business_bridge/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class edit_profile_page extends StatefulWidget {
  @override
  State<edit_profile_page> createState() => _edit_profile_pageState();
}

class _edit_profile_pageState extends State<edit_profile_page> {
  String? chooseItem;
  List listitem = [
    " 🇦🇫  Afghanistan",
    " 🇩🇿  Algeria",
    " 🇦🇴  Angola",
    " 🇦🇷  Argentina",
    " 🇧🇩  Bangladesh",
    " 🇧🇷  Brazil",
    " 🇨🇦  Canada",
    " 🇨🇳  China",
    " 🇨🇴  Colombia",
    " 🇨🇬  Congo",
    " 🇪🇬  Egypt",
    " 🏴󠁧󠁢󠁥󠁮󠁧󠁿  England",
    " 🇪🇹 Ethiopia",
    " 🇫🇷 France",
    " 🇩🇪 Germany",
    " 🇬🇭 Ghana",
    " 🇮🇳 India",
    " 🇮🇩 Indonesia",
    " 🇮🇷 Iran",
    " 🇮🇶 Iraq",
    " 🇮🇹 Italy",
    " 🇯🇵 Japan",
    " 🇰🇪 Kenya",
    " 🇲🇬 Madagascar",
    " 🇲🇾 Malaysia",
    " 🇲🇽 Mexico",
    " 🇲🇦 Morocco",
    " 🇲🇿 Mozambique",
    " 🇲🇲 Myanmar",
    " 🇳🇵 Nepal",
    " 🇳🇿 New Zealand"
        " 🇳🇬 Nigeria",
    " 🇳🇴 Norway",
    " 🇵🇰 Pakistan",
    " 🇵🇭 Philippines",
    " 🇵🇹 Portugal",
    " 🇵🇱 Poland",
    " 🇷🇺 Russia",
    " 🇸🇦 Saudi Arabia",
    " 🏴󠁧󠁢󠁳󠁣󠁴󠁿 Scotland",
    " 🇸🇬 Singapore",
    " 🇿🇦 South Africa",
    " 🇪🇸 Spain",
    " 🇱🇰 Sri Lanka",
    " 🇸🇪 Sweden",
    " 🇸🇾 Syria",
    " 🇺🇦 Ukraine",
    " 🇦🇪 United Arab Emirates",
    " 🇬🇧 United Kingdom",
    " 🇺🇸 United States",
    " 🇻🇳 Vietnam",
    " 🇿🇲 Zambia",
    " 🇿🇼 Zimbabwe",
  ];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Edit profile"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(60)),
                      ),
                      Text("Choose profile photo",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ),

               // ------------------------ business name ----------------------
              Text(
                "Business Name : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter business name';
                    }
                    return null;
                  },
                  //controller: ,
                  keyboardType: TextInputType.name,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter Business Name:',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    label: Text(
                      'Business Name',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    prefixIcon: Icon(
                      Icons.work_sharp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ------------------------ email ------------------------
              Text(
                "Email id : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855)
                          .withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(2, 7),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter E-mail';
                    }
                    if (!RegExp(
                        "^[a-zA-z0-9+_.-]+@[gmail.com]")
                        .hasMatch(value)) {
                      return 'Enter valid E-mail';
                    }
                    return null;
                  },
                  //controller: emailController,
                  keyboardType:
                  TextInputType.emailAddress,
                  cursorColor: Theme.of(context)
                      .colorScheme
                      .secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter Email ID:',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary,
                    ),
                    label: Text(
                      'Email',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ------------------------ contact no ---------------------------
              Text(
                "Contact no : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855)
                          .withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(2, 7),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter contact no.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  cursorColor: Theme.of(context)
                      .colorScheme
                      .secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter Contact no :',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary,
                    ),
                    label: Text(
                      'Contact no',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // ------------------------ business id --------------------------
              Text(
                "Business id : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter business id no';
                    }
                    return null;
                  },
                  //controller: ,
                  keyboardType: TextInputType.name,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter Business id no:',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    label: Text(
                      'Business id',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    prefixIcon: Icon(
                      Icons.work_sharp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ------------------------ user name -------------------------
              Text(
                "User Name : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter User name';
                    }
                    return null;
                  },
                  //controller: ,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter User Name:',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    label: Text(
                      'Set User Name',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    prefixIcon: Icon(
                      Icons.perm_identity_sharp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ------------------------ licence no--------------------------
              Text(
                "Licence no. : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Enter License no./Gst no.';
                    }
                    return null;
                  },
                  //controller: ,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    hintText: 'Enter License no./Gst no.:',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    label: Text(
                      'License no./Gst no.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    prefixIcon: Icon(
                      Icons.insert_page_break_sharp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // ------------------------ country ----------------------------
              Text(
                "Country : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232855).withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    hintText: 'Choose Your Country',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                    label: Text(
                      'Country',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    prefixIcon: Icon(
                      Icons.flag,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  value: chooseItem,
                  onChanged: (newValue) {
                    setState(() {
                      chooseItem = newValue as String?;
                    });
                  },
                  items: listitem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // -------------------- submit -------------------------
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.secondary,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
