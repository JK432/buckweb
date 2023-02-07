import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as Path;
import '../Functions/color.dart';
import '../Functions/crud.dart';
import '../Widgets/alert.dart';
class Adsground extends StatefulWidget {
  const Adsground({Key? key}) : super(key: key);

  @override
  State<Adsground> createState() => _AdsgroundState();
}

class _AdsgroundState extends State<Adsground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => {
        showAlertDialog2ads(context)
      },child: Icon(Icons.add)),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<List<Ads>>(
                    stream: readad(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final quiz = snapshot.data;
                        if (quiz == null || quiz.isEmpty) {
                          return Center(
                            child: Container(
                              child: Center(child: Text("No ads added",style: GoogleFonts.signikaNegative(
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
                                  children:  quiz.map(buildItem).toList(),
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
                        print(snapshot.stackTrace);
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
  Widget buildItem(Ads ad) {
    return GestureDetector(
      onTap:(){ showAlertonclick3ad( context,ad,ad.id);},
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image:DecorationImage(image: NetworkImage(ad.image),fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  Container(child:ad.vis?Container():Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Palette.mainthf,borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Draft",style: GoogleFonts.signikaNegative(



                    fontSize: 30,
                    color: Palette.textd,
                    height: 1),),
              ),
            ),
          )),],
        ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         ad.vis?Container():Text("Draft",style: GoogleFonts.signikaNegative(
        //       fontSize: 40,
        //       color: Palette.textd,
        //       height: 1),),
        //         Expanded(child: Container()),
        //         Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
        // Text(ad.title,style: GoogleFonts.signikaNegative(
        // fontSize: 40,
        // color: Palette.textd,
        // height: 1),),
        // Text(ad.url,style: GoogleFonts.signikaNegative(
        // fontSize: 40,
        // color: Palette.textd,
        // height: 1),),
        //
        //         ],),)
        //       ],
        //     ),
      ),
    );

  }





}

