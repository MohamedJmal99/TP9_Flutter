import 'package:cloud_firestore/cloud_firestore.dart';

class Blog{
  final String title ;
  final String subtitle;
  final DateTime creationDate;

  Blog({required this.title, required this.subtitle }) : creationDate = DateTime.now();
Blog.full({required this.title, required this.subtitle,required this.creationDate});
  Map<String, dynamic> toDocument(){
  return{
    "title": title ,
    "subtitle" : subtitle,
    "creationDate" : creationDate,
  };
}
factory Blog.fromDocument(QueryDocumentSnapshot document){
    Timestamp time= document["creationDate"];
    return Blog.full(
        title: document["title"],
        subtitle: document["subtitle"],
        creationDate: time.toDate()
    );
}
}