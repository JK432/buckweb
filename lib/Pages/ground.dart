
import 'dart:math';
import 'package:bucklite/Functions/Authentication.dart';
import 'package:bucklite/Functions/crud.dart';
import 'package:bucklite/Widgets/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bucklite/Widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Functions/color.dart';
import '../Functions/misfun.dart';
import '../Widgets/button.dart';
class Ground extends StatefulWidget {
  const Ground({Key? key, this.crudact = false, required this.docid,required this.isbox})
      : super(key: key);
  final bool crudact;
  final String docid;
  final bool isbox;

  @override
  State<Ground> createState() => _GroundState();
}
String name="";
class _GroundState extends State<Ground> {
  void namefun()async{
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('name');
    if(action!=null){
      print("called");
      setState(() {
        name = action;
      });

    }else{
      print("called2");
      setState(() {
        name = "AnoniRat";
      });

    }
  }
  void callad()async{

    List<Ads> m=[];
    List<Ads> l = await readaddis();
    l.forEach((element) {
      if(element.vis){
        m.add(element);
      } });

    Random r = Random();
    Future.delayed(Duration(seconds: 3), (){showAlertDialogad(context ,m[r.nextInt(m.length)]);} );
  }
  @override
  void initState() {
// Obtain shared preferences.

    callad();
    namefun();
    //Future.delayed(Duration(seconds: 10), (){showAlertDialogad(context);} );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:widget.isbox?

      StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("box")
            .doc("boxdoc")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data?.data() as Map<String ,dynamic>;
            return data["vis"]?FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                onPressed: (){
                    user u = Authentication().userData();
                    widget.crudact?showAlertDialog3box(context,u.email.split('@')[0]):showAlertDialog3box(context,name);

                }):Container();

          } else {
            return Container();
          }
        },
      )
     // StreamBuilder(
          // stream:FirebaseFirestore.instance
          //     .collection("")
          //     .doc("document_id")
          //     .snapshots() ,
          // builder:(context,snapshot){
          //   return FloatingActionButton(onPressed: (){});
          // } )
      // FloatingActionButton(
      //     child: const Icon(
      //       Icons.add,
      //       size: 30,
      //     ),
      //     onPressed: () {
      //       readopen();
      //       //showAlertDialog3(context, widget.docid);
      //     })
          : widget.crudact
          ? FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            showAlertDialog3(context, widget.docid);
          })
          : Container(),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                      splashRadius: 1,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Palette.main,
                        size: 30,
                      )),
                ),
                SizedBox(width: 20,),
                widget.isbox?widget.crudact?Container():TextButton(onPressed: (){
                  showAlertonname(context,name);

                } , child: Text("Hai " + name,style: GoogleFonts.signikaNegative(
                    fontSize: 25.0, color: Palette.textd) )):Container(),
        SizedBox(width: 20,),
                widget.isbox?widget.crudact? Text("isOpen:",style: GoogleFonts.signikaNegative(
                    fontSize: 25.0, color: Palette.textd) ):Container():Container(),
                SizedBox(width: 1,),
        widget.isbox?widget.crudact?StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("box")
              .doc("boxdoc")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data?.data() as Map<String ,dynamic>;
              bool val = data["vis"];
              return

                Switch(
                  value:val ,

                  onChanged: (value) {
                    Box b = Box();
                    b.vis=value;
                    FirebaseFirestore.instance
                        .collection("box")
                        .doc("boxdoc")
                        .set(b.toJson());
                    setState(() {
                      val= value;

                    });
                  },
                  activeTrackColor: Palette.main,
                  activeColor: Palette.mainthf,
                );

            } else {
              return Container();
            }
          },
        ):Container():Container(),


        ],
            ),












            Container(
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<List<Question>>(
                stream: widget.isbox?readboxQus():readQus(widget.docid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final quiz = snapshot.data;
                    if (quiz == null || quiz.isEmpty) {
                      return Center(
                        child: Container(

                          child: Center(child: Text("Sorry! No docs till now.",style: GoogleFonts.signikaNegative(
                            fontSize: 30.0, color: Palette.textd))),),
                      );
                    } else {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Get Some Code Here:",
                                    style: GoogleFonts.signikaNegative(
                                        fontSize: 30.0, color: Palette.textd),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ] +
                              quiz.map(buildItem).toList() + [SizedBox(height: 30,)],
                        ),
                      );
                      // return StaggeredGridView.count(
                      //
                      //   crossAxisCount: 2,
                      //   children: quiz.map(buildGridItem).toList(),
                      //   staggeredTiles: generateRandomTiles(quiz.length),
                      //
                      // );

                      // return SingleChildScrollView(
                      //   scrollDirection: Axis.vertical,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal:20 ),
                      //     child: Center(
                      //       child: Wrap(
                      //           crossAxisAlignment: WrapCrossAlignment.start,
                      //           children: quiz.map(buildSub).toList()),
                      //     ),
                      //   ),
                      // );
                      // Container(
                      //   decoration: const BoxDecoration(color: Palette.darkbasic),
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Align(
                      //     alignment: Alignment.topCenter,
                      //     child: SingleChildScrollView(
                      //       child: Wrap(
                      //         children: <Widget>[
                      //
                      //         ] +
                      //             quiz.map(buildQuiz).toList(),
                      //       ),
                      //     ),
                      //   ),
                      // );
                    }
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.main),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.main),
                    );
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildItem(Question que) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Palette.textl),
          child: ExpansionTile(

            iconColor: Palette.textd,
            collapsedTextColor: Palette.textd,
            textColor: Palette.textd,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Expanded(
                    child: Text(que.question,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.signikaNegative(
                            fontSize: 30.0, color: Palette.textd)),
                  ),
                ),
                widget.crudact?widget.isbox?
                    //with box
                Align(alignment: Alignment.topRight,child:IconButton(
                    splashRadius: 1,
                    iconSize: 30,
                    onPressed: () {
                      showAlertDialog3boxedit(context, name, que);
                      //showAlertDialog3edit(context,widget.docid, que);
                    },
                    icon: Icon(
                      Icons.build_circle_outlined,
                      color: Palette.textd,
                      size: 30,
                    )) ,)
                    :
                Align(alignment: Alignment.topRight,child:IconButton(
                    splashRadius: 1,
                    iconSize: 30,
                    onPressed: () {
                      showAlertDialog3edit(context,widget.docid, que);
                    },
                    icon: Icon(
                      Icons.build_circle_outlined,
                      color: Palette.textd,
                      size: 30,
                    )) ,):Container(height: 2,),

              ],
            ),
            subtitle: Container(
              child: widget.isbox?Text(que.auth + "  .  " + que.date,
                  style: GoogleFonts.signikaNegative(
                      fontSize: 15.0, color: Palette.textd)):Text(que.auth + "  .  " + timeAgo(DateTime.parse(que.date)),
                  style: GoogleFonts.signikaNegative(
                      fontSize: 15.0, color: Palette.textd)),
            ),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: SelectableText(
                            cursorHeight: 5.0,
                            showCursor: true,
                            cursorColor: Palette.main,
                            cursorWidth: 5.0,
                            que.ans,
                            style: GoogleFonts.robotoMono(
                                fontSize: 15.0, color: Palette.textd)),
                      ),
                    ),
                  ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(

            onTap: ()  async{
              await Clipboard.setData(ClipboardData(text: que.ans)).then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarinfo(que.question + " Copied To Clipboard")));
            },
            child:const RectButton(title: "Copy") ,),
        ),
      )
                ],
              )
            ],
            //trailing: ,
          ),
        ),
      ),
      // onTap: (){
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => widget.crudact?Ground(docid: sub.id,crudact: true,): Ground(docid: sub.id,crudact: false,) ));
      //
      // },
    );
  }
}
