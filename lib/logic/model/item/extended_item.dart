import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';

class ExtendedItem extends ShortItem {
  final (double, double, double) size;
  final double weight;
  ExtendedItem(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required super.description,
      required this.size,
      required this.weight});

  static ExtendedItem fromShortItem(ShortItem item, (double, double, double) size, double weight) => ExtendedItem(
      id: item.id,
      name: item.name,
      imageUrl: item.imageUrl,
      description: item.description,
      size: size,
      weight: weight);
}
