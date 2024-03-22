import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tp9/entities/blog.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog Page"),
      ),
      body: FutureBuilder(
        future: firestore.collection("items").get(),
        builder:(context, snapshot){
          if (snapshot.hasError){
            return const Text("error");
        }
          if (snapshot.hasData){
            print(snapshot.data?.docs.toString());
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index){
                Blog blog = Blog.fromDocument(snapshot.data!.docs[index],
                );
                return Card(
                  child: ListTile(
                    title: Text(blog.title),
                    subtitle: Text(blog.subtitle),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator(),);
    }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController title = TextEditingController();
          TextEditingController subtitle = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Add Blog",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller: title,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Content"),
                      controller: subtitle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        Blog blog =
                            Blog(title: title.text, subtitle: subtitle.text);
                        firestore.collection("items").add(blog.toDocument());
                        Navigator.of(context).pop();
                      },
                      child: const Text("Create"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
