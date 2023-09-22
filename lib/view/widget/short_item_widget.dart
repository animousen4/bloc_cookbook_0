import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';
import 'package:bloc_cookbook_0/view/screen/extended_item/extended_item_screen.dart';
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
        // !!!! we pass arg to backgroundImage, not to child!!!
        backgroundImage: NetworkImage(shortItem.imageUrl),
      ),
      trailing: Text("ID: ${shortItem.id.toString()}"),
      onTap: () {
        // We should show a new screen with extended info of our item, by passing
        // to this screen id.
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExtendedItemScreen(
                  id: shortItem.id,
                )));
      },
    );
  }
}
