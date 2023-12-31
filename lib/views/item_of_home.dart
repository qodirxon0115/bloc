import 'package:flutter/material.dart';

import '../model/post_model.dart';
import 'item_of_post.dart';

Widget viewOfHome(List<Post> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}
