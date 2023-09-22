import 'package:bloc_cookbook_0/logic/bloc/item_bloc.dart';
import 'package:bloc_cookbook_0/view/widget/short_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // We lookup our bloc (ItemBloc) instance in a tree above
    // and subcribe on state changes of this bloc.
    // The items below BlocBuilder rebuilds, as soon as bloc emits new state.
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return resolveWidget(state);
      },
    );
  }

  // we'll resolve our widget, depending on out state.
  Widget resolveWidget(ItemState state) {

    // return our items on ready
    if (state is ItemReady) {
      return ListView.builder(
        itemBuilder: (context, index) =>
            ShortItemWidget(shortItem: state.shortItems[index]),
        itemCount: state.shortItems.length,
      );
    }

    // otherwise, return loading indicator (for 2 left states: ItemInitial and ItemLoading)
    return const Center(
        child: CircularProgressIndicator(),
      );
  }
}
