import 'package:bloc_cookbook_0/logic/bloc/item_bloc.dart';
import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShortItemWidget extends StatelessWidget {
  final ShortItem shortItem;
  const ShortItemWidget({super.key, required this.shortItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(shortItem.name),
      subtitle: Text(shortItem.description),
      leading: CircleAvatar(
        child: Image.network(shortItem.imageUrl),
      ),
      trailing: Text("ID: ${shortItem.id.toString()}"),
      onTap: () {

        // context.read<T> - we are going up in a widget tree and searching instance of
        // this object (T). In our case, it's a ItemBloc, which we pushed it to our tree upper
        // with the help of BlocProvider.
        
        // We are creating a new event (OpenitemEvent) with add(EVENT(event_args...)) method and passing args to this event (id)
        // Bloc will process this event and emit a state (or ignore, it depends on how we define the logic of bloc).
        context.read<ItemBloc>().add(OpenItemEvent(shortItem.id));
      },
    );
  }
}
