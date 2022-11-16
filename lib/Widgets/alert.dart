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








showAlertDialog2edit(BuildContext context,Subject sub) {
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
        updatesub(title: title, desc: desc, url: url, id: sub.id).then((value) {snackbar().snackBarSucess("Updated");Navigator.of(context).pop();});
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


  AlertDialog alert = AlertDialog(
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
  String question = "";
  String code = "";

  Widget deleteButton = InkWell(
    onTap: ()  {
      Navigator.of(context).pop();
      showAlertondelete3edit(context, que,docid);
      // Deletequestioncollection(docid: sub.id).then((value) {snackbar().snackBarSucess("Deleted");Navigator.of(context).pop();});
    },
    child:const RectButton(title: "Delete") ,);


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
        Updatequestion(question:question ,date:DateTime.now().toString() ,ans:code ,docid:docid ,auth:Authentication().userData().email ,id:que.id );
        Navigator.of(context).pop();
      }
    },
    child:const RectButton(title: "Update") ,) ;

  AlertDialog alert = AlertDialog(
    backgroundColor: Palette.bgl,
    title:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Update Question",style: GoogleFonts.signikaNegative(
            fontSize: 23.0, color: Palette.textd),),
        deleteButton
      ],
    ),
    content: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Form(
          key: formKey2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: que.question,
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
                  initialValue: que.ans,
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