import 'package:bloc_cookbook_0/logic/bloc/item_bloc/item_bloc.dart';
import 'package:bloc_cookbook_0/logic/services/item_delivery_service/item_delivery_service.dart';
import 'package:bloc_cookbook_0/view/screen/home/pages/catalog_page.dart';
import 'package:bloc_cookbook_0/view/screen/home/pages/profile_page.dart';
import 'package:bloc_cookbook_0/view/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  // define once time pages here
  final pages = [const CatalogPage(), const ProfilePage()];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavBarPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // We provide a bloc instance for all sub elements.
    // Eeach element under child of BlocProvider could get
    // access to ItemBloc, via context.read<ItemBloc>.
    //
    // They can add some events, using
    // context.read<ItemBloc>.add(EVENT_CLASS(event args ... ))
    // and screen will be updated everywhere, where we has BlocBuilder with
    // defined instance of ItemBloc (look catalog_page.dart file)
    return BlocProvider(
      // we provide to bloc our ItemDeliveryService from context, which was already provided in root of tree (look app.dart)
      create: (context) => ItemBloc(context.read<ItemDeliveryService>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsScreen()));
                },
                icon: Icon(Icons.settings))
          ],
        ),
        // selecting current page from list of available const pages;
        body: widget.pages[bottomNavBarPageIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavBarPageIndex,
            onTap: (newPageIndex) => setState(() {
                  bottomNavBarPageIndex = newPageIndex;
                }),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Profile"),
            ]),
      ),
    );
  }
}
