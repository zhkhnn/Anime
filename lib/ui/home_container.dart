import 'package:flutter/material.dart';

import '../widgets/bottom_menu.dart';
import '../widgets/button_widget.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          BottomButton(
            buttonTitle: '+',
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Play',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ))
        ],
      ),
    );
  }
}
