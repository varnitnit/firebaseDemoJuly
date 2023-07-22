import 'package:firebase_demo/cubit_kilo_loco/get_demo/posts_cubits.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/cubit_kilo_loco/get_demo/post_model.dart';

class PostViewsScreen extends StatefulWidget {
  const PostViewsScreen({Key? key}) : super(key: key);

  @override
  State<PostViewsScreen> createState() => _PostViewsScreenState();
}

class _PostViewsScreenState extends State<PostViewsScreen> {

  @override
  void initState() {
    debugPrint("Class: $runtimeType");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("posts entry point"),
      ),
      body:  Container(
        margin: const EdgeInsets.all(20),
        child: BlocProvider<PostsCubit>(
          create:(context)=>PostsCubit()..getPosts(),
          child:const  PostViews(),
        ),
      ),
    );
  }
}


class PostViews extends StatelessWidget {
  const PostViews({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<PostsCubit,List<PostModel>>(
        builder: (context,posts){
          if(posts.isEmpty){
            return const Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemBuilder: (context,index){
                return ListTile(
                  leading: Container(
                    width: width*.15,
                    height: width*.15,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.shade300,
                        border: Border.all(color: Colors.black)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(width*.5)),
                      child: CachedNetworkImage(
                        width: width*.15,
                        height: width*.15,
                        imageUrl: "widget.user.image",
                        fit: BoxFit.cover ,
                        /* progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress,)),*/
                        errorWidget: (context, url, error) => const Icon(Icons.person),
                      ),
                    ),
                  ),
                  title: Text(
                      posts[index].title
                  ),
                  subtitle: Text(posts[index].body),

                );
              },
            );
          }
        },
      ),
    );
  }
}
