import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  apiPostCreate(BuildContext context, String title, String body) async {
    emit(CreatePostLoading());

    var response = await Network.POST(
        Network.BASE + Network.API_CREATE,
        Network.paramsCreate(
            Post(
                userId: Random().nextInt(pow(2, 30) - 1),
                id: Random().nextInt(pow(2, 30) - 1),
                title: title,
                body: body
            )
        )
    );

    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}