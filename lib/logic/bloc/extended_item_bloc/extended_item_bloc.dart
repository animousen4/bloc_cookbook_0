import 'package:bloc/bloc.dart';
import 'package:bloc_cookbook_0/logic/model/item/extended_item.dart';
import 'package:bloc_cookbook_0/logic/services/item_delivery_service/item_delivery_service.dart';
import 'package:meta/meta.dart';

part 'extended_item_event.dart';
part 'extended_item_state.dart';

class ExtendedItemBloc extends Bloc<ExtendedItemEvent, ExtendedItemState> {
  final ItemDeliveryService itemDeliveryService;
  final int id;

  ExtendedItemBloc(this.id, this.itemDeliveryService)
      : super(ExtendedItemInitial()) {
    // Handle LoadItem event + ASYNC function
    on<LoadItem>((event, emit) async {
      // emitting loading state before any actions, that could take some time
      emit(ExtendedItemLoading());

      // getting and waiting for our EXTENDED item by given id
      final extendedItem = await itemDeliveryService.getExtendedItem(id);
      
      // emitting a new state with our item
      emit(ExtendedItemReady(extendedItem));
    });
  }
}
