import 'package:bloc_cookbook_0/logic/model/item/extended_item.dart';
import 'package:bloc_cookbook_0/logic/model/item/short_item.dart';

class ItemDeliveryService {
  // We use Future to indicate that we need some time to load it
  // later (ask server and get resonse). So, we use 'async'
  // keyword after function header (only with Future return type, like Future<RETURN_TYPE>,
  // where RETURN_TYPE is an object, that we would receive then).

  // But we also need to wait until the moment, when we will receive this object.
  // And here is a 'await' keyword. We can use this keyword only in other ASYNC function
  // with return type 'Future'
  // For example, we have function header:
  //
  // Future<int> getAge();
  //
  // But we want to get this int value, and lets do the following:
  //
  // Future<void> main() async {
  //  int k = await getAge(); // we are waiting (but program continue works*), until we
  //  someOtherFunction();    // receive this value, and lines below this command
  //                          // wouldn't be completed, and again, until we won't receive
  //  print(k);               // this value from function.
  //                          //
  //                          // * - program continues to work, it just makes a note, that we
  //                          //     should return here, when this command will be completed.
  //                          //     Flutter App is 1-Thread process. We can't execute 2 commands
  //                          //     at the same time. So, program goes and completes other commands,
  //                          //     until we receive response from this ASYNC command. When we receive
  //                          //     it, we come back to our function, where it was executed, and
  //                          //     continue executing other commands ( someOtherFunction() and print() ),
  //                          //     which were below this just completed async command.
  //
  // }

  // Now here:
  // This function returns List<ShortItems>. But we don't know when we will receive it (here we simulate
  // time delay in order to show how does it work).

  final List<ShortItem> _shortItems = <ShortItem>[
    ShortItem(
        id: 1,
        name: "Meow",
        imageUrl:
            "https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.jpg",
        description: "A meow cat!!!!!!"),
    ShortItem(
        id: 2,
        name: "Doggie",
        imageUrl:
            "https://images.pexels.com/photos/2607544/pexels-photo-2607544.jpeg?cs=srgb&dl=pexels-simona-kidri%C4%8D-2607544.jpg&fm=jpg",
        description: "A cute doggiee!!!"),
    ShortItem(
        id: 3,
        name: "Banana",
        imageUrl:
            "data:image/jpeg;base64,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",
        description: "*This is banana*. Tasty.")
  ];






  Future<List<ShortItem>> getHomeShortItems() async {
    // We simulate response time (300ms)
    List<ShortItem> items = await Future<List<ShortItem>>.delayed(
        Duration(milliseconds: 300),
        // we pass second arg as lambda function with List<ShortItem>return type.
        () {
      return _shortItems;
    });
    return items;
  }





  Future<ExtendedItem> getExtendedItem(int id) async {
    final ShortItem shortItem =
        _shortItems.where((element) => element.id == id).first;

    await Future.delayed(Duration(milliseconds: 1200)); // fake delay
    final res = ExtendedItem.fromShortItem(shortItem, (100, 100, 100), 123);
    return res;
  }



}
