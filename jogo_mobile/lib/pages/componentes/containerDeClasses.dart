import 'package:flutter/material.dart';

class ContainerDeClasse extends StatefulWidget {
  @override
  _ContainerDeClasseState createState() => _ContainerDeClasseState();
}

class _ContainerDeClasseState extends State<ContainerDeClasse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 130,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
