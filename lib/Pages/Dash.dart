import 'package:bucklite/Functions/Authentication.dart';
import 'package:bucklite/Widgets/button.dart';
import 'package:bucklite/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Functions/color.dart';
import 'home.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  @override
  user u1 = Authentication().userData();
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     child: Text("SignOut"),
      //     onPressed: () {
      //       Authentication().signOut(context);
      //     },
      //   ),
      // ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Text("Hai BUCK!",style: GoogleFonts.anton(
                  fontSize: 40.0, color: Palette.textd),),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2.0,color: Palette.textd)
                ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: " + u1.email, style: GoogleFonts.signikaNegative(
                        fontSize: 30.0, color: Palette.textd), ),
                    Text("UID: " + u1.uid,  style: GoogleFonts.signikaNegative(
                        fontSize: 30.0, color: Palette.textd), ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Authentication().signOut(context);
                        //     .then((value) =>
                        //     // Navigator.pushReplacement(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //         builder: (context) => Home(crudact: false,)))
                        //
                        // );

                      },
                      child: const RectButton(title: "SignOut",),
                    ),
                  ],
                ),
              ),
            ),const SizedBox(height: 20,),
              Wrap(

                direction: axisDirectionToAxis(AxisDirection.left),

                children: [
                  Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home(crudact: true,)));
                      },
                      child: const RectButton(title: "CRUD",),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: const RectButton(title: "Buck Chat",),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: const RectButton(title: "Buck Box ",),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: const RectButton(title: "Buck Ans",),
                    ),
                  ),
                ]

            )
            ],
          ),
        ),
      ),
    );
  }
}
