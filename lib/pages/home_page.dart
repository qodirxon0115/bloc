import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_post_cubit.dart';
import '../blocs/home_post_state.dart';
import '../model/post_model.dart';
import '../views/item_of_home.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC'),
        centerTitle: true,
      ),
      body: BlocBuilder<ListPostCubit, ListPostState> (
        builder: (BuildContext context, ListPostState state) {
          if(state is ListPostError) {
            return viewOfHome(items, true);
          }

          if (state is ListPostLoaded) {
            items = state.posts;
            return viewOfHome(items, false);
          }

          return viewOfHome(items, true);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}