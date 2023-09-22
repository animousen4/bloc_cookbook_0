import 'package:bloc/bloc.dart';
import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';
import 'package:bloc_cookbook_0/logic/services/item_delivery_service/item_delivery_service.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  // Our bloc communicates with itemDeliveryService, which provides us information
  // with items
  final ItemDeliveryService itemDeliveryService;

  // passing to super our initial state (on initialization of bloc - ItemInitial)
  ItemBloc(this.itemDeliveryService) : super(ItemInitial()) {
    // Handling an LoadShortItems event
    // We can react on this, by using 'emit' command
    // When we use emit, we pass a state, which would be emitted
    // Our lamda function, that we pass to 'on' also could be ASYNC (look at item_delivery_service)
    // and here it is
    on<LoadShortItems>((event, emit) async {
      // First things first, we emit a loading state, because communicating with our service
      // could take a some time.
      emit(
          ItemLoading()); // After that, all BlocBuilders with instance of ItemBloc, rebuilds.

      final items = await itemDeliveryService
          .getHomeShortItems(); // We are waiting for our items

      // we've received our items, so let's emit a new state with that items;
      emit(ItemReady(items));
    });
  }
}
