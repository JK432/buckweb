import 'package:bucklite/Widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Functions/Authentication.dart';
import '../Functions/color.dart';
import '../Functions/crud.dart';
import 'button.dart';


  showAlertDialog(BuildContext context) {
    GlobalKey<FormState> formKey2 = GlobalKey();
    String email = "";
    String password = "";

    Widget cancelButton = TextButton(
      child: Text("Cancel",style: GoogleFonts.signikaNegative(
          fontSize: 23.0, color: Palette.textd),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = InkWell(
      onTap: ()  {
        if (formKey2.currentState!.validate()) {
           Authentication().signIn(email, password, context);
           Navigator.of(context).pop();
        }
      },
      child:const RectButton(title: "SignIn") ,) ;

    AlertDialog alert = AlertDialog(
      backgroundColor: Palette.bgl,
      title:  Text("Prove us you are BUCK!",style: GoogleFonts.signikaNegative(
          fontSize: 23.0, color: Palette.textd),),
      content: Container(
        child: Form(
            key: formKey2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Email:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Email';
                      } else {
                        email = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    obscureText: true,
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Password:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter the Password';
                      } else {
                        password = input;
                      }
                      return null;
                    }),
              ],
            )),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  // ad alert
showAlertDialogad(BuildContext context,Ads ads) async{

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );


  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text(ads.title,style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: GestureDetector(
      onTap: ()async{
        Uri link = Uri.parse(ads.url);
if(await canLaunchUrl(link)){
  launchUrl(link);
}
      },
      child: Container(
        height: 500,
        width: 500,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(ads.image),fit: BoxFit.cover)),
      ),
    ),
    actions: [
      cancelButton,

    ],
  );
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool('isshowed',true);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




//Addad

//ADD SUBJECT

showAlertDialog2ads(BuildContext context) {
  GlobalKey<FormState> formKey4 = GlobalKey();
  String title = "";
  String image = "";
  String url = "";
  bool vis = true;

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey4.currentState!.validate()) {
        Createad(title: title, image: image, url: url, vis: vis).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
       // Createsub(title: title,desc: desc,url: url,vis: vis).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Add") ,) ;

  StatefulWidget alert = StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Palette.bgl,
          title:  Text("Add an ad!",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
          content: Container(
            child: Form(
                key: formKey4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                        style: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),
                        cursorColor: Palette.main,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorStyle: GoogleFonts.signikaNegative(
                              fontSize: 15, color: Palette.main, height: 0.99),
                          focusColor: Palette.main,
                          fillColor: Palette.main,
                          hintText: "Title:",
                          hintStyle: GoogleFonts.signikaNegative(
                              fontSize: 23, color: Palette.textd, height: 0.99),
                        ),
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return 'Please enter the Title';
                          } else {
                            title = input;
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        style: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),

                        cursorColor: Palette.main,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorStyle: GoogleFonts.signikaNegative(
                              fontSize: 15, color: Palette.main, height: 0.99),
                          focusColor: Palette.main,
                          fillColor: Palette.main,
                          hintText: "Image url",
                          hintStyle: GoogleFonts.signikaNegative(
                              fontSize: 23, color: Palette.textd, height: 0.99),
                        ),

                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return 'Enter image url';
                          } else {
                            image = input;
                          }
                          return null;
                        }),

                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                        initialValue:"https://www.mycomputercareer.edu/wp-content/uploads/2020/05/The-Guide-to-Information-Technology-and-Its-Role-During-COVID-19.jpg",
                        style: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),
                        cursorColor: Palette.main,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.textd),
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette.main),
                          ),
                          errorStyle: GoogleFonts.signikaNegative(
                              fontSize: 15, color: Palette.main, height: 0.99),
                          focusColor: Palette.main,
                          fillColor: Palette.main,
                          hintText: "Url:",
                          hintStyle: GoogleFonts.signikaNegative(
                              fontSize: 23, color: Palette.textd, height: 0.99),
                        ),
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return 'Please the url';
                          } else {
                            url = input;
                          }
                          return null;
                        }),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text( "Is Vissible ",
                          style:
                          GoogleFonts.signikaNegative(
                              fontSize: 23, color: Palette.textd, height: 0.99),),
                        Checkbox(
                          value: vis,
                          onChanged:( value) {
                            setState(() {
                              vis = value!;
                            });


                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          actions: [
            cancelButton,
            continueButton,
          ],
        );}
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}














//ADD SUBJECT

showAlertDialog2(BuildContext context) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String title = "";
  String desc = "";
  String url = "";
  bool vis = true;

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey2.currentState!.validate()) {
        Createsub(title: title,desc: desc,url: url,vis: vis).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Add") ,) ;

  StatefulWidget alert = StatefulBuilder(
      builder: (context, setState) {
    return AlertDialog(
      backgroundColor: Palette.bgl,
      title:  Text("Add Subject!",style: GoogleFonts.signikaNegative(
          fontSize: 23.0, color: Palette.textd),),
      content: Container(
        child: Form(
            key: formKey2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Sub Name:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Name';
                      } else {
                        title = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Description",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),

                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter some Description';
                      } else {
                        desc = input;
                      }
                      return null;
                    }),

                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  initialValue:"https://www.mycomputercareer.edu/wp-content/uploads/2020/05/The-Guide-to-Information-Technology-and-Its-Role-During-COVID-19.jpg",
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Img Url:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please a url';
                      } else {
                        url = input;
                      }
                      return null;
                    }),
                SizedBox(height: 20,),
                Row(
                  children: [
                   Text( "Is Vissible ",
                    style:
                    GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),),
                    Checkbox(
                      value: vis,
                      onChanged:( value) {
                        setState(() {
                          vis = value!;
                        });


                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );}
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


//Edit ads
showAlertDialog2editad(BuildContext context,Ads ad) {
  GlobalKey<FormState> formKey5 = GlobalKey();
  String title = "";
  String image = "";
  String url = "";
  bool vis = ad.vis;

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey5.currentState!.validate()) {
        updatead(title: title, image: image, url: url, id: ad.id,vis: vis).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
        //Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Update") ,) ;


  Widget deleteButton = InkWell(
    onTap: ()  {
      Navigator.of(context).pop();
      showAlertondelete2editad(context,ad);
      //showAlertondelete2edit(context, ad);
      // Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,);



  StatefulWidget alert = StatefulBuilder(builder: (context, setState) {

    return AlertDialog(
      backgroundColor: Palette.bgl,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Update ad!",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
          deleteButton
        ],
      ),
      content: Container(
        child: Form(
            key: formKey5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    initialValue: ad.title,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Title:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Title';
                      } else {
                        title = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    initialValue: ad.image,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Image",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter some Description';
                      } else {
                        image = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                    initialValue:ad.url,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Url:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please a url';
                      } else {
                        url = input;
                      }
                      return null;
                    }),



                SizedBox(height: 20,),
                Row(
                  children: [
                    Text( "Is Vissible ",
                      style:
                      GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),),
                    Checkbox(
                      value: vis,
                      onChanged:( value) {
                        setState(() {
                          vis = value!;
                        });


                      },
                    ),
                  ],
                ),





              ],
            )),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

  });



  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




//EDIT SUBJECT
showAlertDialog2edit(BuildContext context,Subject sub) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String title = "";
  String desc = "";
  String url = "";
  bool vis = sub.vis;

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey2.currentState!.validate()) {
        updatesub(title: title, desc: desc, url: url, id: sub.id,vis: vis).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
        //Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Update") ,) ;


  Widget deleteButton = InkWell(
    onTap: ()  {
      Navigator.of(context).pop();
      showAlertondelete2edit(context, sub);
     // Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,);



  StatefulWidget alert = StatefulBuilder(builder: (context, setState) {

    return AlertDialog(
      backgroundColor: Palette.bgl,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Update Subject!",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
          deleteButton
        ],
      ),
      content: Container(
        child: Form(
            key: formKey2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    initialValue: sub.title,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Sub Name:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the Sub Name';
                      } else {
                        title = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    initialValue: sub.desc,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Description",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter some Description';
                      } else {
                        desc = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                    initialValue:sub.url,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Palette.main),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Img Url:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please a url';
                      } else {
                        url = input;
                      }
                      return null;
                    }),



                SizedBox(height: 20,),
                Row(
                  children: [
                    Text( "Is Vissible ",
                      style:
                      GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),),
                    Checkbox(
                      value: vis,
                      onChanged:( value) {
                        setState(() {
                          vis = value!;
                        });


                      },
                    ),
                  ],
                ),





              ],
            )),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

  });



  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


//delete ad
showAlertondelete2editad(BuildContext context,Ads ad) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String code = "";


  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {

        Deletead(docid: ad.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
        //Navigator.of(context).pop();
        //updatesub(title: title, desc: desc, url: url, id: sub.id).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
        //Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});

    },
    child:const RectButton(title: "Delete") ,) ;




  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Delete Ad!",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(child:Text("Alert!\nIf you delete this ad then it will be lost forever.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.alert),) ),


        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



showAlertondelete2edit(BuildContext context,Subject sub) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String code = "";


  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey2.currentState!.validate()) {
        Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
        //Navigator.of(context).pop();
        //updatesub(title: title, desc: desc, url: url, id: sub.id).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
        //Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Delete") ,) ;




  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Delete Subject!",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(child:Text("Alert!\nIf you delete this Subject then all documents saved inside this subject will be lost forever.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.alert),) ),
          Container(child:Text("Enter the Subject name.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),) ),
          Form(
              key: formKey2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                      style: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                      cursorColor: Palette.main,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.textd),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.textd),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.main),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.main),
                        ),
                        errorStyle: GoogleFonts.signikaNegative(
                            fontSize: 15, color: Palette.main, height: 0.99),
                        focusColor: Palette.main,
                        fillColor: Palette.main,
                        hintText: "Subject name:",
                        hintStyle: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty ) {
                          return 'Please enter the Name';
                        } else {

                          if(input != sub.title){
                            return 'You are not stable!';
                          }else{
                            code = input;
                          }

                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}




showAlertondelete3edit(BuildContext context,Question que,String docid) {



  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {

        //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
     Deletequestion(docid: docid, id: que.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,) ;




  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Delete Question!",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(child:Text("Alert!\nIf you delete this Question then it will be lost forever.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.alert),) ),
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//delete box que
showAlertondelete3doxedit(BuildContext context,Question que) {



  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {

      //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
      Deleteboxquestion(id: que.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
      //Deletequestion(docid: docid, id: que.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,) ;




  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Delete Question!",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(child:Text("Alert!\nIf you delete this Question then it will be lost forever.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.alert),) ),
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


//update delete ad
showAlertonclick3ad(BuildContext context,Ads ad,String docid) {



  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget delbtn = InkWell(
    onTap: ()  {
      Navigator.of(context).pop();
      showAlertondelete2editad(context, ad);
      //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
     // Deletequestion(docid: docid, id: que.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,) ;

  Widget updatebtn= InkWell(
    onTap: ()  {
      Navigator.of(context).pop();
      showAlertDialog2editad(context, ad);
      //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
      // Deletequestion(docid: docid, id: que.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Update") ,) ;


  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Ad detail",style: GoogleFonts.signikaNegative(
            fontSize: 23.0, color: Palette.textd),),
        Expanded(child: Container()),
        updatebtn,
        SizedBox(width: 10,),
        delbtn,

      ],
    ),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              overflow: TextOverflow.ellipsis,
              "Title : "+ad.title,style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
          SizedBox(height: 10,),
          Text(
            overflow: TextOverflow.ellipsis,
            "Image url: "+ad.image,style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),) ,
          SizedBox(height: 10,),
          Text(
            overflow: TextOverflow.ellipsis,
            "url: "+ad.url,style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),) ,
        ],
      ),
    ),
    actions: [
      cancelButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



//boxinput
showAlertDialog3box(BuildContext context,String name) {

  GlobalKey<FormState> formKey2 = GlobalKey();
  String question = "";
  String code = "";

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey2.currentState!.validate()) {
        Addboxquestion(auth:name+"@buck.com",name:"boxdox",ans: code ,date:DateTime.now().toString() ,question: question);
        Navigator.of(context).pop();
      }
    },
    child:const RectButton(title: "Add") ,) ;

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Add Question",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
          key: formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  maxLines: 2,
                  style: GoogleFonts.signikaNegative(
                      fontSize: 23, color: Palette.textd, height: 0.99),
                  cursorColor: Palette.main,
                  decoration: InputDecoration(
                    enabledBorder:  const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.textd, width: 2.0),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder:  const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.main, width: 2.0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.failed, width: 2.0),
                    ),
                    errorStyle: GoogleFonts.signikaNegative(
                        fontSize: 15, color: Palette.main, height: 0.99),
                    focusColor: Palette.main,
                    fillColor: Palette.main,
                    hintText: "Question:",
                    hintStyle: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter the question';
                    } else {
                      question=input;

                    }
                    return null;
                  }),
              const SizedBox(
                height: 19,
              ),
              Expanded(
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    minLines: null,
                    expands: true,
                    maxLines: null,

                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      // enabledBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Palette.textd),
                      // ),
                      enabledBorder:  const OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd, width: 2.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder:  const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.main, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.failed, width: 2.0),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Code:",

                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter the code';
                      } else {
                        code=input;
                      }
                      return null;
                    }),
              ),
            ],
          )),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}









showAlertDialog3(BuildContext context,String docid) {

  GlobalKey<FormState> formKey2 = GlobalKey();
  String question = "";
  String code = "";

  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  {
      if (formKey2.currentState!.validate()) {
        Addquestion(auth:Authentication().userData().email,docid:docid,ans: code ,date:DateTime.now().toString() ,question: question);
        Navigator.of(context).pop();
      }
    },
    child:const RectButton(title: "Add") ,) ;

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Add Question",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
          key: formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(

                maxLines: 2,
                  style: GoogleFonts.signikaNegative(
                      fontSize: 23, color: Palette.textd, height: 0.99),
                  cursorColor: Palette.main,
                  decoration: InputDecoration(
                    enabledBorder:  const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Palette.textd, width: 2.0),
          ),
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder:  const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.main, width: 2.0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.failed, width: 2.0),
                    ),
                    errorStyle: GoogleFonts.signikaNegative(
                        fontSize: 15, color: Palette.main, height: 0.99),
                    focusColor: Palette.main,
                    fillColor: Palette.main,
                    hintText: "Question:",
                    hintStyle: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter the question';
                    } else {
                      question=input;

                    }
                    return null;
                  }),
              const SizedBox(
                height: 19,
              ),
              Expanded(
                child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                  minLines: null,
                    expands: true,
                    maxLines: null,

                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      // enabledBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Palette.textd),
                      // ),
                      enabledBorder:  const OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textd, width: 2.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder:  const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.main, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.failed, width: 2.0),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Code:",

                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter the code';
                      } else {
                        code=input;
                      }
                      return null;
                    }),
              ),
            ],
          )),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


showAlertDialog3edit(BuildContext context,String docid,Question que) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String question = que.question;
  String code = que.ans;

  Widget deleteButton = InkWell(
    onTap: () {

      Navigator.of(context).pop();
      showAlertondelete3edit(context, que, docid);
      //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child: const RectButton(title: "Delete"),);






  Widget cancelButton = TextButton(
    child: Text("Cancel", style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: () {
      if (formKey2.currentState!.validate()) {
        Updatequestion(question: question,
            date: DateTime.now().toString(),
            ans: code,
            docid: docid,
            auth: Authentication()
                .userData()
                .email,
            id: que.id);
        Navigator.of(context).pop();
      }
    },
    child: const RectButton(title: "Update"),);


  StatefulWidget alert = StatefulBuilder(builder: (context, setState) {
  return AlertDialog(
    backgroundColor: Palette.bgl,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Update Question", style: GoogleFonts.signikaNegative(
            fontSize: 23.0, color: Palette.textd),),
    Expanded(child: Container(),),
    SizedBox(width: 5,),
    TextButton(
  child: Text("Clear Code", style: GoogleFonts.signikaNegative(
      fontSize: 23.0, color: Palette.textd),),
    onPressed: () {
    setState(() {
    code="";
    });
    print(code);
    },
    ),
        deleteButton
      ],
    ),
    content: Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Form(
          key: formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  initialValue: question,
                  maxLines: 2,
                  style: GoogleFonts.signikaNegative(
                      fontSize: 23, color: Palette.textd, height: 0.99),
                  cursorColor: Palette.main,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.textd, width: 2.0),
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.main, width: 2.0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Palette.failed, width: 2.0),
                    ),
                    errorStyle: GoogleFonts.signikaNegative(
                        fontSize: 15, color: Palette.main, height: 0.99),
                    focusColor: Palette.main,
                    fillColor: Palette.main,
                    hintText: "Question:",
                    hintStyle: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                  ),
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter the question';
                    } else {
                      question = input;
                    }
                    return null;
                  }),
              const SizedBox(
                height: 19,
              ),

              Expanded(
                child: TextFormField(
                    key: Key(code.toString()), // <- Magic!
                    initialValue: code.toString(),

                    textAlignVertical: TextAlignVertical.top,
                    minLines: null,
                    expands: true,
                    maxLines: null,

                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),

                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      // enabledBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Palette.textd),
                      // ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Palette.textd, width: 2.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.main, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.failed, width: 2.0),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Code:",

                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Enter the code';
                      } else {
                        code = input;
                      }
                      return null;
                    }),
              ),
            ],
          )),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
});
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//boxeditupdate
showAlertDialog3boxedit(BuildContext context,String name,Question que) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String question = que.question;
  String code = que.ans;

  Widget deleteButton = InkWell(
    onTap: () {

      Navigator.of(context).pop();
      showAlertondelete3doxedit(context, que);
      //showAlertondelete3edit(context, que, docid);
      //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child: const RectButton(title: "Delete"),);






  Widget cancelButton = TextButton(
    child: Text("Cancel", style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: () {
      if (formKey2.currentState!.validate()) {
        Updateboxquestion(question: question, date: DateTime.now().toString(), ans:code, auth:name+"@buck.com", id: que.id);
        // Updatequestion(question: question,
        //     date: DateTime.now().toString(),
        //     ans: code,
        //     docid: docid,
        //     auth: Authentication()
        //         .userData()
        //         .email,
        //     id: que.id);
        Navigator.of(context).pop();
      }
    },
    child: const RectButton(title: "Update"),);


  StatefulWidget alert = StatefulBuilder(builder: (context, setState) {
    return AlertDialog(
      backgroundColor: Palette.bgl,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Update Question", style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),),
          Expanded(child: Container(),),
          SizedBox(width: 5,),
          TextButton(
            child: Text("Clear Code", style: GoogleFonts.signikaNegative(
                fontSize: 23.0, color: Palette.textd),),
            onPressed: () {
              setState(() {
                code="";
              });
              print(code);
            },
          ),
          deleteButton
        ],
      ),
      content: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Form(
            key: formKey2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    initialValue: question,
                    maxLines: 2,
                    style: GoogleFonts.signikaNegative(
                        fontSize: 23, color: Palette.textd, height: 0.99),
                    cursorColor: Palette.main,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.textd, width: 2.0),
                      ),
                      border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.main, width: 2.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Palette.failed, width: 2.0),
                      ),
                      errorStyle: GoogleFonts.signikaNegative(
                          fontSize: 15, color: Palette.main, height: 0.99),
                      focusColor: Palette.main,
                      fillColor: Palette.main,
                      hintText: "Question:",
                      hintStyle: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                    ),
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter the question';
                      } else {
                        question = input;
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 19,
                ),

                Expanded(
                  child: TextFormField(
                      key: Key(code.toString()), // <- Magic!
                      initialValue: code.toString(),

                      textAlignVertical: TextAlignVertical.top,
                      minLines: null,
                      expands: true,
                      maxLines: null,

                      style: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),

                      cursorColor: Palette.main,
                      decoration: InputDecoration(
                        // enabledBorder: const UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Palette.textd),
                        // ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.textd, width: 2.0),
                        ),
                        border: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Palette.main, width: 2.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Palette.failed, width: 2.0),
                        ),
                        errorStyle: GoogleFonts.signikaNegative(
                            fontSize: 15, color: Palette.main, height: 0.99),
                        focusColor: Palette.main,
                        fillColor: Palette.main,
                        hintText: "Code:",

                        hintStyle: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Enter the code';
                        } else {
                          code = input;
                        }
                        return null;
                      }),
                ),
              ],
            )),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  });
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
//username alert
showAlertonname(BuildContext context,String name) {
  String code=name;
  GlobalKey<FormState> formKey2 = GlobalKey();
  Widget cancelButton = TextButton(
    child: Text("Cancel",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = InkWell(
    onTap: ()  async{
      if (formKey2.currentState!.validate()) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', code).then((value){Navigator.of(context).pop();}
        );
        ;
        //Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
        //Navigator.of(context).pop();
        //updatesub(title: title, desc: desc, url: url, id: sub.id).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
        //Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Change") ,) ;




  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Text("Change name!",style: GoogleFonts.signikaNegative(
        fontSize: 23.0, color: Palette.textd),),
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(child:Text("Alert!\nIf you delete this Subject then all documents saved inside this subject will be lost forever.",style: GoogleFonts.signikaNegative(
          //     fontSize: 23.0, color: Palette.alert),) ),
          Container(child:Text("Enter the new Name.",style: GoogleFonts.signikaNegative(
              fontSize: 23.0, color: Palette.textd),) ),
          Form(
              key: formKey2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                      initialValue: code,
                      style: GoogleFonts.signikaNegative(
                          fontSize: 23, color: Palette.textd, height: 0.99),
                      cursorColor: Palette.main,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.textd),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.textd),
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.main),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.main),
                        ),
                        errorStyle: GoogleFonts.signikaNegative(
                            fontSize: 15, color: Palette.main, height: 0.99),
                        focusColor: Palette.main,
                        fillColor: Palette.main,
                        hintText: "Name:",
                        hintStyle: GoogleFonts.signikaNegative(
                            fontSize: 23, color: Palette.textd, height: 0.99),
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty ) {
                          return 'Please enter the Name';
                        } else {

                            code = input;


                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
