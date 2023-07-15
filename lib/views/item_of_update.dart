import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../blocs/update_post_cubit.dart';
import '../model/post_model.dart';

_finish(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.pop(context, 'result');
  });
}

Widget viewOfUpdate(
    BuildContext context,
    TextEditingController titleTextEditingController,
    TextEditingController bodyTextEditingController,
    bool isLoading) {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Title
              Container(
                height: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Center(
                  child: TextField(
                    controller: titleTextEditingController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // Body
              Container(
                height: 300,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: TextField(
                  controller: bodyTextEditingController,
                  style: const TextStyle(fontSize: 18),
                  maxLines: 30,
                  decoration: const InputDecoration(
                    labelText: 'Body',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Post post = Post(
                      id: Random().nextInt(100),
                      title: titleTextEditingController.text,
                      body: bodyTextEditingController.text,
                      userId: Random().nextInt(100));
                  UpdatePostCubit().apiPostUpdate(post);
                  _finish(context);
                },
                child: const Text("update"),
              ),
            ],
          ),
        ),
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}
