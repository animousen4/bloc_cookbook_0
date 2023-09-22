import 'package:bloc/bloc.dart';
import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  // passing to super our initial state (on initialization of bloc - ItemInitial)
  ItemBloc() : super(ItemInitial()) {
    on<ItemEvent>((event, emit) {
      
    });
  }
}
