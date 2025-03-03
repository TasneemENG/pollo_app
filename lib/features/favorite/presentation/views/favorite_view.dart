import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/favorite_body.dart';
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favorite'),
      body: FavoriteBody(),
    );
  }
}
