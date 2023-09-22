import 'package:bloc_cookbook_0/logic/services/item_delivery_service/item_delivery_service.dart';
import 'package:bloc_cookbook_0/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Root Widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Here we provide our ItemDeliveryService to our tree. All below elements in this tree
    // could access to it, by context.read<ItemDeliveryService>.
    return RepositoryProvider(
      create: (context) => ItemDeliveryService(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
