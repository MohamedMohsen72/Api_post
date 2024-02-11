import 'package:flutter/material.dart';
import 'package:api_post/api_services.dart';
import 'package:api_post/post_model/post_model.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: ApiServices.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      PostModel post = snapshot.data![index];
                      return ListTile(
                          leading: Text(post.id.toString()),
                          title: Text(post.title.toString()),
                          subtitle: Text(post.body.toString()));
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text('error');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
