import 'package:bloc_cookbook_0/logic/bloc/extended_item_bloc/extended_item_bloc.dart';
import 'package:bloc_cookbook_0/logic/services/item_delivery_service/item_delivery_service.dart';
import 'package:bloc_cookbook_0/view/widget/extended_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtendedItemScreen extends StatelessWidget {
  // id of item, that we would pass to ExtendedItemBloc, which would control it and load
  // some data
  final int id;
  const ExtendedItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Providing a bloc
    return BlocProvider(
      create: (context) =>
          ExtendedItemBloc(id, context.read<ItemDeliveryService>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Item info"),
        ),
        body: ExtendedItemCard()
      ),
    );
  }

}
