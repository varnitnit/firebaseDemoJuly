
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/model/chatUser.dart';
import 'package:flutter/material.dart';
class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    debugPrint("image== ${widget.user.image}");
    return Container(
      child: ListTile(
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
              imageUrl: widget.user.image,
             fit: BoxFit.cover ,
             /* progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress,)),*/
              errorWidget: (context, url, error) => Icon(Icons.person),
            ),
          ),
        ),
        title: Text(
          widget.user.name
        ),
        subtitle: Text(widget.user.email),
        trailing: Text(widget.user.lastActive),
      ),
    );
  }
}
