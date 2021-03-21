import 'package:app_ventas/data/models/info_model.dart';
import 'package:app_ventas/ui/adapters/cardview_info.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: infos.length,
            itemBuilder: (context, index) => InfoCard(
              chat: infos[index],
              press: null,
            ),
          ),
        ),
      ],
    );
  }
}
