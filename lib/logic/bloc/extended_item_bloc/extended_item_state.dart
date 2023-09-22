part of 'extended_item_bloc.dart';

@immutable
sealed class ExtendedItemState {}

final class ExtendedItemInitial extends ExtendedItemState {}

final class ExtendedItemLoading extends ExtendedItemState {}

final class ExtendedItemReady extends ExtendedItemState {
  final ExtendedItem item;

  ExtendedItemReady(this.item);
}
