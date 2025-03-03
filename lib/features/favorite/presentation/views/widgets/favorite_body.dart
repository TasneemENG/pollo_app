import 'package:flutter/material.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/favorite_tab.dart';
import 'favorite_tab_bar.dart';
import 'saved_tab.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavoritesTabBar(tabController: _tabController),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              FavoriteTab(),
              SavedTab(),

            ],
          ),
        ),
      ],
    );
  }
}
