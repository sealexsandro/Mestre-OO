import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/model/usuario.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Usuario> futureUser = Usuario.get();
    return SafeArea(
      child: Container(
        width: 280,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: futureUser,
              builder: (context, snapshot) {
                Usuario user = snapshot.data;
                return user !=null? contaDoUsuario(user) : Container();
              },
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

  UserAccountsDrawerHeader contaDoUsuario(Usuario user) {
    return UserAccountsDrawerHeader(
      // accountName: FutureBuilder(
      //  future: Prefs.getString("nome"),
      //   builder: (context, snapshot) {
      //     return Text(snapshot.hasData ? snapshot.data : "");
      //   },
      // ),
    //  accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
       // backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }
}
