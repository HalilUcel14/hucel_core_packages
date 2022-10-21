import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../../../core/model/drawer_model.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ColumnWithSpacing(
            spacing: 16,
            children: drawerModel.onListWidget(),
          ),
        ],
      ),
    );
  }
}
