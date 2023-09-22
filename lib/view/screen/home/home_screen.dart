import 'package:bloc_cookbook_0/logic/bloc/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We provide a bloc instance for all sub elements.
    // Eeach element under child of BlocProvider could get
    // access to ItemBloc, via context.read<ItemBloc>.
    //
    // They can add some events, using
    // context.read<ItemBloc>.add(EVENT_CLASS(event args ... ))
    // and screen will be updated everywhere, where we has BlocBuilder with
    // defined instance of ItemBloc (look catalog_page.dart file)
    return BlocProvider(
      create: (context) => ItemBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Independent of ListView widget"),

            // We expand to the left area on the screen
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) => Text("item $index"),
                itemCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
