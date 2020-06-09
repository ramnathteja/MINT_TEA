import 'package:flutter/material.dart';
import 'package:mint_tea/size_config.dart';

class WorkBuilding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
          color: Colors.red[600],
          width: SizeConfig.blockSizeHorizontal * 21.0,
          height: SizeConfig.blockSizeVertical * 4.8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 30.0),
              color: Colors.red[600],
              height: SizeConfig.blockSizeVertical * 43.50,
              width: SizeConfig.blockSizeHorizontal * 2.80,
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  color: Colors.red[600],
                  width: SizeConfig.blockSizeHorizontal * 20.0,
                  height: SizeConfig.blockSizeVertical * 4.8,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 30.9,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  color: Colors.red[600],
                  width: SizeConfig.blockSizeHorizontal * 20.0,
                  height: SizeConfig.blockSizeVertical * 4.8,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
