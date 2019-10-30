import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 280,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              // accountName: FutureBuilder(
              //  future: Prefs.getString("nome"),
              //   builder: (context, snapshot) {
              //     return Text(snapshot.hasData ? snapshot.data : "");
              //   },
              // ),
              accountName: Text("sebas@gmail.com"),
              accountEmail: Text("sebas@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.iconscout.com/icon/free/png-256/avatar-372-456324.png"),
              ),
            ),
            ListTile(
              onTap: () {
                print("Item 1");
              },
              title: Text("Configurações"),
              subtitle: Text(
                "Mais informações...",
              ),
              leading: Icon(Icons.star),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                print("Item 2");
              },
              title: Text("Ajuda"),
              subtitle: Text(
                "Mais informações...",
              ),
              leading: Icon(Icons.star),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 3");
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
