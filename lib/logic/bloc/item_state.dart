part of 'item_bloc.dart';

@immutable
sealed class ItemState {}

final class ItemInitial extends ItemState {}

final class ItemLoading extends ItemState {}

final class ItemReady extends ItemState {
  final List<ShortItem> shortItems;

  ItemReady(this.shortItems);
}
