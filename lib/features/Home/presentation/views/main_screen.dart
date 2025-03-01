
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/resources/app_images.dart';
import 'package:pollo/features/Home/presentation/manager/bottom_nav_cubit.dart';
import 'package:pollo/features/Home/presentation/views/widgets/bottom_nav_bar_widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(), // Provide the Cubit
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return Center(
              child: _widgetOptions.elementAt(selectedIndex),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating Action Button Pressed');
          },
          child: Image.network(Assets.buttom_nav),
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          elevation: 7,
        ),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Favourite Page'),
    Text('Add Ads Page'),
    Text('Account Page'),
  ];
}
