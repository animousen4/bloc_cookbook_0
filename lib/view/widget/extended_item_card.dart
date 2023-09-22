import 'package:bloc_cookbook_0/logic/bloc/extended_item_bloc/extended_item_bloc.dart';
import 'package:bloc_cookbook_0/logic/model/item/extended_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtendedItemCard extends StatefulWidget {
  const ExtendedItemCard({super.key});

  @override
  State<ExtendedItemCard> createState() => _ExtendedItemCardState();
}

class _ExtendedItemCardState extends State<ExtendedItemCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtendedItemBloc, ExtendedItemState>(
      builder: (context, state) {
        return resolveWidget(state, context);
      },
    );
  }

  Widget resolveWidget(ExtendedItemState state, BuildContext context) {
    // return our ready widget

    if (state is ExtendedItemReady) {
      final size = state.item.size;
      return ListView(
        children: [
          Image.network(state.item.imageUrl),
          ListTile(title: Text("Name"), subtitle: Text(state.item.name)),
          ListTile(
              title: Text("Description"),
              subtitle: Text(state.item.description)),
          ListTile(
            title: Text("Properties"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Weight: ${state.item.weight}"),
                Text("Size: ${size.$1} x ${size.$2} x ${size.$3}"),
                Text("ID: ${state.item.id}")
              ],
            ),
          )
        ],
      );
    }

    // in other case, for ExtendedItemInitial and ExtendedItemLoading, we return circular loading indicator
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // As soon as we are view card, we should load some data
  // Let's bother our bloc (ExtendedItemBloc), which is already in our tree and add some events to it
  @override
  void initState() {
    context.read<ExtendedItemBloc>().add(LoadItem());
    super.initState();
  }
}
