


import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  String id;
  String url;
  String title;
  String desc;
  Subject({
    this.id = "",
    this.url ="",
    this.title = "",
    this.desc = "",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'desc': desc,
    'url':url,
  };
  static Subject fromJson(Map<String, dynamic> Json) => Subject(
    id: Json['id'],
    desc: Json['desc'],
    title: Json['title'],
    url:Json['url']
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

Future Createsub({required String title, required String desc,required String url}) async {
  String id = DateTime.now().millisecondsSinceEpoch.toString();

  final subject = FirebaseFirestore.instance.collection("subject").doc(id);
  final sub = Subject(
    title: title,
    desc: desc,
    id: id,
    url: url,
  );
  final json = sub.toJson();
  await subject.set(json).then((value) => null);
}


Future updatesub({required String title, required String desc,required String url,required String id}) async {
  //String id = DateTime.now().millisecondsSinceEpoch.toString();

  final subject = FirebaseFirestore.instance.collection("subject").doc(id);
  final sub = Subject(
    title: title,
    desc: desc,
    id: id,
    url: url,
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
      required String docid
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







Stream<List<Subject>> readSub() =>
    FirebaseFirestore.instance.collection('subject').snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Subject.fromJson(doc.data())).toList());

Stream<List<Question>> readQus(String docid) =>
    FirebaseFirestore.instance.collection('subject').doc(docid).collection('questions').snapshots().map((snaphot) =>
        snaphot.docs.map((doc) => Question.fromJson(doc.data())).toList());