


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//ads
class Box{
  bool vis;
  Box({
    this.vis = true,
  });
  Map<String, dynamic> toJson() => {
    'vis':vis,
  };
  static Box fromJson(Map<String, dynamic> Json) => Box(
      vis:Json['vis']
  );
}
class Ads {
  String id;
  String url;
  String title;
  String image;
  bool vis;
  Ads({
    this.id = "",
    this.url ="",
    this.title = "",
    this.image = "",
    this.vis = true,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image': image,
    'url':url,
    'vis':vis,
  };
  static Ads fromJson(Map<String, dynamic> Json) => Ads(
      id: Json['id'],
      image: Json['image'],
      title: Json['title'],
      url:Json['url'],
      vis:Json['vis']
  );
}

class Subject {
  String id;
  String url;
  String title;
  String desc;
  bool vis;
  Subject({
    this.id = "",
    this.url ="",
    this.title = "",
    this.desc = "",
    this.vis = true,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'desc': desc,
    'url':url,
    'vis':vis,
  };
  static Subject fromJson(Map<String, dynamic> Json) => Subject(
    id: Json['id'],
    desc: Json['desc'],
    title: Json['title'],
    url:Json['url'],
    vis:Json['vis']
  );
}



class Question {
  String id;
  String question;
  String date;
  String ans;
  String auth;

  Question({

    this.id = "",
    this.question = "",
    this.ans = "",
    this.auth = "",
    this.date= "",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'ans': ans,
    'auth' : auth,
    'date': date,
  };
  static Question fromJson(Map<String, dynamic> Json) => Question(
    id: Json['id'],
    question: Json['question'],
    ans: Json['ans'],
    auth : Json['auth'],
    date: Json['date'],
  );
}

Future Deletequestion({required String docid, required id})async{

  final qp = FirebaseFirestore.instance
      .collection("subject")
      .doc(docid)
      .collection("questions")
      .doc(id);
  try{
    qp.delete();
  }catch(e){}

}


Future Deletequestioncollection({required String docid})async {
  final qp = FirebaseFirestore.instance
      .collection("subject")
      .doc(docid);

  try {
    qp.delete();
  } catch (e) {}
}

Future Createsub({required String title, required String desc,required String url,required bool vis}) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();

  final subject = FirebaseFirestore.instance.collection("subject").doc(id);
  final sub = Subject(
    title: title,
    desc: desc,
    id: id,
    url: url,
    vis: vis,
  );
  final json = sub.toJson();
  await subject.set(json).then((value) => null);
}


Future updatesub({required String title, required String desc,required String url,required String id,required bool vis }) async {
  //String id = DateTime.now().millisecondsSinceEpoch.toString();

  final subject = FirebaseFirestore.instance.collection("subject").doc(id);
  final sub = Subject(
    title: title,
    desc: desc,
    id: id,
    url: url,
    vis: vis,
  );
  final json = sub.toJson();
  await subject.update(json).then((value) => null);
}



Future Addquestion(
    {
    required String question,
      required String date,
      required String ans,
      required String auth,
      required String docid,

    }) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final quest = FirebaseFirestore.instance
      .collection("subject")
      .doc(docid)
      .collection("questions")
      .doc(id);
  final qst = Question(
    id: id,
    question: question,
    ans: ans,
    auth : auth,
    date: date,
  );
  final json = qst.toJson();
  await quest.set(json).then((value) => null);
}

//add boxquestion
Future Addboxquestion(
    {
      required String question,
      required String date,
      required String ans,
      required String auth,
      required String name,

    }) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final quest = FirebaseFirestore.instance
      .collection("box")
      .doc("boxdoc")
      .collection("questions")
      .doc(id);
  final qst = Question(
    id: id,
    question: question,
    ans: ans,
    auth : auth,
    date: date,
  );
  final json = qst.toJson();
  await quest.set(json).then((value) => null);
}

Future Updatequestion(
    {
      required String question,
      required String date,
      required String ans,
      required String auth,
      required String docid,
      required String id
    }) async {
  //String id = DateTime.now().millisecondsSinceEpoch.toString();
  final quest = FirebaseFirestore.instance
      .collection("subject")
      .doc(docid)
      .collection("questions")
      .doc(id);
  final qst = Question(
    id: id,
    question: question,
    ans: ans,
    auth : auth,
    date: date,
  );
  final json = qst.toJson();
  await quest.update(json).then((value) => null);
}
//update box question
Future Updateboxquestion(
    {
      required String question,
      required String date,
      required String ans,
      required String auth,
      required String id
    }) async {
  //String id = DateTime.now().millisecondsSinceEpoch.toString();
  final quest = FirebaseFirestore.instance
      .collection("box")
      .doc("boxdoc")
      .collection("questions")
      .doc(id);
  final qst = Question(
    id: id,
    question: question,
    ans: ans,
    auth : auth,
    date: date,
  );
  final json = qst.toJson();
  await quest.update(json).then((value) => null);
}
//delete box
Future Deleteboxquestion({ required id})async{

  final qp = FirebaseFirestore.instance
      .collection("box")
      .doc("boxdoc")
      .collection("questions")
      .doc(id);
  try{
    qp.delete();
  }catch(e){}

}
//ads functions

//add ads

Future Createad({required String title, required String image,required String url,required bool vis}) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();

  final addb = FirebaseFirestore.instance.collection("ads").doc(id);
  final ad = Ads(
    title: title,
    image:image,
    id: id,
    url: url,
    vis: vis,
  );
  final json = ad.toJson();
  await addb.set(json).then((value) => null);
}
//delete ads

Future Deletead({required String docid})async {
  final qp = FirebaseFirestore.instance
      .collection("ads")
      .doc(docid);

  try {
    qp.delete();
  } catch (e) {}
}
//updatead
Future updatead({required String title, required String image,required String url,required String id,required bool vis }) async {
  //String id = DateTime.now().millisecondsSinceEpoch.toString();

  final addb = FirebaseFirestore.instance.collection("ads").doc(id);
  final ad = Ads(
    title: title,
    image: image,
    id: id,
    url: url,
    vis: vis,
  );
  final json = ad.toJson();
  await addb.update(json).then((value) => null);
}




Stream<List<Subject>> readSub() =>
    FirebaseFirestore.instance.collection('subject').orderBy("id",descending: true).snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Subject.fromJson(doc.data())).toList());

Stream<List<Question>> readQus(String docid) =>
    FirebaseFirestore.instance.collection('subject').doc(docid).collection('questions').orderBy("id",descending: true).snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Question.fromJson(doc.data())).toList());

//readad
Stream<List<Ads>> readad() =>
    FirebaseFirestore.instance.collection('ads').orderBy("id",descending: true).snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Ads.fromJson(doc.data())).toList());

Stream<List<Question>> readboxQus() =>
    FirebaseFirestore.instance.collection('box').doc('boxdoc').collection('questions').orderBy("id",descending: true).snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Question.fromJson(doc.data())).toList());

readopen(){ FirebaseFirestore.instance.collection('box').doc("boxdoc").get().then(
    (DocumentSnapshot doc) {
  final data = doc.data() as Map<String,dynamic>;
return data;
});
}

readaddis() async{
  List<Ads>l = [];
  await FirebaseFirestore.instance.collection('ads').get().then((value) => value.docs.forEach((element) {l.add(Ads.fromJson(element.data()));}));
  return l;
  // FirebaseFirestore.instance.collection("ads").get().then((querySnapshot) {
  //   querySnapshot.docs.forEach((result) {
  //     print(result.data());
  //   });
  // });
  // FirebaseFirestore.instance.collection('ads').orderBy("id",descending: true).get().then((querySnapshot){
  //   querySnapshot.docs.map((e){print(Ads.fromJson(e.data()));});
    //print(l);
    // map((snaphot) =>
    //     snaphot.docs.map((doc) => Ads.fromJson(doc.data())).toList());
  // });
}