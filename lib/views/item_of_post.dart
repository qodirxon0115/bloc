import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post_model.dart';

Widget itemOfPost(BuildContext context, Post post){
  return Slidable(
      startActionPane: ActionPane(
        motion:const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: "Update",
          )
        ],
      ),
      endActionPane: ActionPane(
        motion:const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title.toUpperCase()),
            const SizedBox(height: 5,),
            Text(post.body),
          ],
        ),
      )
  );
}