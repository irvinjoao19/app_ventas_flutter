import 'package:app_ventas/constants.dart';
import 'package:app_ventas/data/models/info_model.dart';
import 'package:app_ventas/data/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({
    Key key,
    @required this.chat,
    @required this.press,
  }) : super(key: key);

  final Info chat;
  final VoidCallback press;

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool _themeDark = false;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _themeDark = prefs.themeDark;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    SwitchListTile(
                        value: _themeDark,
                        title: Text(
                          widget.chat.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          widget.chat.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onChanged: (value) {
                          setState(() {
                            prefs.themeDark = value;
                            _themeDark = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
