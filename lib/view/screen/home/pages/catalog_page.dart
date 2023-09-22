import 'package:bloc_cookbook_0/logic/bloc/item_bloc/item_bloc.dart';
import 'package:bloc_cookbook_0/view/widget/short_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
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

  // IMPORTANT!
  // initState() calls, before this widget have built
  // so, we can talk with our bloc here and add some events,
  // like here, LoadShortItems()
  @override
  void initState() {
    context.read<ItemBloc>().add(LoadShortItems());
    super.initState();
  }
}
