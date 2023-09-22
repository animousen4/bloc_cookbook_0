part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class OpenItemEvent extends ItemEvent {
  final int id;
  OpenItemEvent(this.id);
}
