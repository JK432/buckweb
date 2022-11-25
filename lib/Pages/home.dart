import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bucklite/Functions/crud.dart';
import 'package:bucklite/Pages/ground.dart';
import 'package:bucklite/Widgets/alert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Functions/color.dart';


class Home extends StatefulWidget {
  const Home({Key? key, this.crudact = false}) : super(key: key);
  final bool crudact;
  @override
  State<Home> createState() => _HomeState();
}

String adminmsg = "Hai Buck,\nPlease login  ";
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

  Widget build(BuildContext context) {
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 0.0,
              collapsedHeight: 0.0,
              expandedHeight: MediaQuery.of(context).size.height,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Center(
                    child: Container(
                      child: DefaultTextStyle(
                        style: GoogleFonts.signikaNegative(
                            fontSize: 30.0, color: Palette.textd),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "#BUCK",
                              style: GoogleFonts.anton(
                                  color: Palette.textd,
                                  fontSize:width>491?200:width/4,

                              ),
                            ),
                            AnimatedTextKit(
                              pause: const Duration(milliseconds: 2000),
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'बक जीवन में आपका स्वागत है',
                                  speed: const Duration(milliseconds: 100),
                                ),
                                TypewriterAnimatedText(
                                  'bienvenue en buck life',
                                  speed: const Duration(milliseconds: 100),
                                ),
                                TypewriterAnimatedText(
                                  'Bienvenido a la buck life',
                                  speed: const Duration(milliseconds: 100),
                                ),
                                TypewriterAnimatedText(
                                  '벅 라이프에 오신 것을 환영합니다',
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  children:  quiz.map(buildGridItem).toList(),
                                ),
                              ] + [SizedBox(height: 30,)],
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
            ),
          ),
        ),
      ),
    );
  }




  Widget buildGridItem(Subject sub) {

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
          image:DecorationImage(image:CachedNetworkImageProvider(errorListener: (){sub.url=" ";print("fixed");},sub.url),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 400,
        width:300,
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.crudact?Ground(docid: sub.id,crudact: true,): Ground(docid: sub.id,crudact: false,) ));

      },
    );
  }


}
//
// Random random = new Random();
//
// Widget buildSub(Subject sub) => Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Expanded(
//         flex: 3,
//         child: Container(
//           height: 200,
//           width: 350,
//           decoration: BoxDecoration(
//               color: col[random.nextInt(5)],
//               borderRadius: BorderRadius.circular(5)),
//           child: Column(
//             children: [Text(sub.title)],
//           ),
//         ),
//       ),
//     );










