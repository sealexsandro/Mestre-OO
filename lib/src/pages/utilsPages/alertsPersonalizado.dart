import 'package:flutter/material.dart';

alertPersonalizado(BuildContext context, String msg, {Function callback}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(
      child: Container(
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        padding: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Mestre OO".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Construindo Classes",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height / 3,
              margin: EdgeInsets.only(left: 10, top: 5),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        "Ok".toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
