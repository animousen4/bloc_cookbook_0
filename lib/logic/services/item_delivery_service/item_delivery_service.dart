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
            "https://img.freepik.com/free-vector/sticker-design-with-banana-isolated_1308-77292.jpg?w=2000",
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
