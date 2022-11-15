import 'package:bucklite/Widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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


showAlertDialog2(BuildContext context) {
  GlobalKey<FormState> formKey2 = GlobalKey();
  String title = "";
  String desc = "";
  String url = "";

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
        Createsub(title: title,desc: desc,url: url).then((value) {snackbar().snackBarSucess("Added");Navigator.of(context).pop();});
      }
    },
    child:const RectButton(title: "Add") ,) ;

  AlertDialog alert = AlertDialog(
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


