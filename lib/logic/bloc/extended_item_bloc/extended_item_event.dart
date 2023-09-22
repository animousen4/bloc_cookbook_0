part of 'extended_item_bloc.dart';

@immutable
sealed class ExtendedItemEvent {}

final class LoadItem extends ExtendedItemEvent {
  LoadItem();
}
