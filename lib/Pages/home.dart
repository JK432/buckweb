import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import "dart:math";
import 'package:bucklite/Functions/crud.dart';
import 'package:bucklite/Pages/ground.dart';
import 'package:bucklite/Widgets/alert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Functions/color.dart';
import '../Widgets/button.dart';


class Home extends StatefulWidget {
  const Home({Key? key, this.crudact = false}) : super(key: key);
  final bool crudact;
  @override
  State<Home> createState() => _HomeState();
}

String adminmsg = "Hai Buck,\nPlease login  ";
Widget m = Container();
List<Color> col = [Palette.l1, Palette.l2, Palette.l3, Palette.l4, Palette.l5];

class _HomeState extends State<Home> {
  @override
  void _onSelected(int value, BuildContext context) async {
    switch (value) {
      case 0:
        showAlertDialog(context);
        break;
      case 1:
        Navigator.of(context).pop();
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Dash()));
        break;
      case 2:
        // TODO:Settings go here
        break;
      case 3:
        //Authentication().signOut(context);
        break;
      default:
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

callad();
  //Future.delayed(Duration(seconds: 10), (){showAlertDialogad(context);} );
  super.initState();
  }


@override
  Widget build(BuildContext context) {
    final keyIsFirstLoaded = 'is_first_loaded';

    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: widget.crudact
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showAlertDialog2(context);
              },
            )
          : Container(),
      // body: NestedScrollView(
        // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //   return <Widget>[
        //     SliverAppBar(
        //       toolbarHeight: 0.0,
        //       collapsedHeight: 0.0,
        //       expandedHeight: MediaQuery.of(context).size.height,
        //       floating: false,
        //       pinned: true,
        //       flexibleSpace: FlexibleSpaceBar(
        //           centerTitle: true,
        //           background: Center(
        //             child: Container(
        //               child: DefaultTextStyle(
        //                 style: GoogleFonts.signikaNegative(
        //                     fontSize: 30.0, color: Palette.textd),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       "#BUCK",
        //                       style: GoogleFonts.anton(
        //                           color: Palette.textd,
        //                           fontSize:width>491?200:width/4,
        //
        //                       ),
        //                     ),
        //                     AnimatedTextKit(
        //                       pause: const Duration(milliseconds: 2000),
        //                       repeatForever: true,
        //                       animatedTexts: [
        //                         TypewriterAnimatedText(
        //                           'बक जीवन में आपका स्वागत है',
        //                           speed: const Duration(milliseconds: 100),
        //                         ),
        //                         TypewriterAnimatedText(
        //                           'bienvenue en buck life',
        //                           speed: const Duration(milliseconds: 100),
        //                         ),
        //                         TypewriterAnimatedText(
        //                           'Bienvenido a la buck life',
        //                           speed: const Duration(milliseconds: 100),
        //                         ),
        //                         TypewriterAnimatedText(
        //                           '벅 라이프에 오신 것을 환영합니다',
        //                           speed: const Duration(milliseconds: 100),
        //                         ),
        //                       ],
        //                       onTap: () {
        //
        //                       },
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           )),
        //     ),
        //   ];
        // },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PopupMenuButton<int>(
                      padding: const EdgeInsets.all(5),
                      tooltip: "",
                      iconSize: 50,
                      splashRadius: 1,
                      color: Palette.main,

                      icon: Icon(
                        size: 40,
                        Icons.account_circle_outlined,
                        color: Palette.main,
                      ),
                      itemBuilder: (context) {
                        return [
                          widget.crudact
                              ? PopupMenuItem<int>(
                                  value: 1,
                                  child: Container(
                                      child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Dashboard",
                                        style: GoogleFonts.signikaNegative(
                                            fontSize: 23,
                                            color: Palette.textd,
                                            height: 1),
                                      ),
                                    ],
                                  )),
                                )
                              : PopupMenuItem<int>(
                                  value: 0,
                                  child: Container(
                                      height: 60,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            adminmsg,
                                            style: GoogleFonts.signikaNegative(
                                                fontSize: 23,
                                                color: Palette.textd,
                                                height: 1),
                                          ),
                                        ],
                                      )),
                                ),
                        ];
                      },
                      onSelected: (v) => _onSelected(v, context),
                      // onSelected: (v) => _onSelected(v, context)
                    ),


            InkWell(
            onTap: ()  {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.crudact?Ground(docid: "boxdoc",crudact: true,isbox: true,): Ground(docid: "boxdoc",crudact: false,isbox: true,) ));
    },
      child:Container(
        height: 32,
        width: 225,
child: Row(
  children: [
    SizedBox(width: 20,),
        Text("Try New BuckBox",style: GoogleFonts.signikaNegative(

        fontSize: 25.0, color: Palette.textd)),
  ],
),
        decoration: BoxDecoration(
           gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
          colors: [
            Colors.yellow,
            Colors.red,
            Colors.indigo,
            Colors.teal,
          ],
        ),


          borderRadius:BorderRadius.circular(25),
      ) ,)
            )],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<List<Subject>>(
                    stream: readSub(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final quiz = snapshot.data;
                        if (quiz == null || quiz.isEmpty) {
                          return  Center(
                            child:  Container(

                              child: Center(child: Text("Sorry! No docs till now.",style: GoogleFonts.signikaNegative(
                                  fontSize: 30.0, color: Palette.textd))),),
                          );
                        } else {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Get Some Code Here:", style: GoogleFonts.signikaNegative(
                                    fontSize: 30.0, color: Palette.textd),) ,
                                SizedBox(height: 20,),
                                Wrap(
                                  spacing: 20,
                                  runSpacing: 20,
                                  children:  quiz.map(buildGridItem).toList().toSet().difference([m].toSet()).toList(),
                                ),
                              ] + [SizedBox(height: 30,)],
                            ),
                          );

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
            ),
          ),
        ),
      // ),
    );
  }




  Widget buildGridItem(Subject sub) {

if(sub.vis){

  return GestureDetector(
  child: Container(

    child: Column(
      children: [
        Container(
          height:400/1.5 ,
          child: widget.crudact?Align(alignment: Alignment.topRight,child:IconButton(
              splashRadius: 1,
              iconSize: 25,
              onPressed: () {
                showAlertDialog2edit(context, sub);
              },
              icon: Icon(
                Icons.build_circle_outlined,
                color: Palette.main,
                size: 30,
              )) ,):Container(),
        ),
        Container(
          decoration: BoxDecoration(
              color: Palette.mainthf,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10) ,bottomRight:Radius.circular(10))
          ),
          width: 300,
          height: 400 - (400/1.5 ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(sub.title,style: GoogleFonts.signikaNegative(
                    fontSize: 40,
                    color: Palette.textd,
                    height: 1),),
                Text(sub.desc,style: GoogleFonts.signikaNegative(
                    fontSize: 23,
                    color: Palette.textd,
                    height: 1),)
              ],

            ),
          ),)
      ],
    ),
    decoration: BoxDecoration(
      image:DecorationImage(image:CachedNetworkImageProvider(errorListener: (error){sub.url=" ";print("fixed");},sub.url),fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(10),
    ),
    height: 400,
    width:300,
  ),
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget.crudact?Ground(docid: sub.id,crudact: true,isbox:false): Ground(docid: sub.id,crudact: false,isbox: false,) ));

  },
);



}
else{

  if(widget.crudact){
    return GestureDetector(
      child: Container(

        child: Column(
          children: [
            Container(
              height:400/1.5,
              child: Container(


                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textBaseline: TextBaseline.ideographic,

                  children: [
                  SizedBox(width: 8,),
                  Container(child:sub.vis?Container():Container(

                    decoration: BoxDecoration(
                        color: Palette.mainthf,borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Draft",style: GoogleFonts.signikaNegative(



                              fontSize: 30,
                              color: Palette.textd,
                              height: 1),),
                    ),
                  )),

                  Expanded(child: Container()),

                  widget.crudact?Align(alignment: Alignment.topRight,child:IconButton(
                      splashRadius: 1,
                      iconSize: 25,
                      onPressed: () {
                        showAlertDialog2edit(context, sub);
                      },
                      icon: Icon(
                        Icons.build_circle_outlined,
                        color: Palette.main,
                        size: 30,
                      )) ,):Container(),





                ],),
              )
            ),
            Container(
              decoration: BoxDecoration(
                  color: Palette.mainthf,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10) ,bottomRight:Radius.circular(10))
              ),
              width: 300,
              height: 400 - (400/1.5 ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(sub.title,style: GoogleFonts.signikaNegative(
                        fontSize: 40,
                        color: Palette.textd,
                        height: 1),),
                    Text(sub.desc,style: GoogleFonts.signikaNegative(
                        fontSize: 23,
                        color: Palette.textd,
                        height: 1),)
                  ],

                ),
              ),)
          ],
        ),
        decoration: BoxDecoration(
          image:DecorationImage(image:CachedNetworkImageProvider(errorListener: (error){sub.url=" ";print("fixed");},sub.url),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 400,
        width:300,
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.crudact?Ground(docid: sub.id,crudact: true,isbox: false,): Ground(docid: sub.id,crudact: false,isbox:false) ));

      },
    );
  }else{
    return m;
  }
}

  }


}







