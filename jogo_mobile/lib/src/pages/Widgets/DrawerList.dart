import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controleDrawerList.dart';
import 'package:jogo_mobile/src/model/usuario.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  ControleDrawerList controleDrawerList;

  @override
  void initState() {
    super.initState();
    controleDrawerList = new ControleDrawerList();
  }

  @override
  Widget build(BuildContext context) {
    // Future<Usuario> futureUser = Usuario.get();
    Future<FirebaseUser> futureUser = FirebaseAuth.instance.currentUser();
    return SafeArea(
      child: Container(
        width: 280,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            FutureBuilder<FirebaseUser>(
              future: futureUser,
              builder: (context, snapshot) {
                FirebaseUser user = snapshot.data;
                return user != null ? contaDoUsuario(user) : Container();
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
                this.controleDrawerList.onclickLogout(context);
              },
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader contaDoUsuario(FirebaseUser user) {
    return UserAccountsDrawerHeader(
      // accountName: FutureBuilder(
      //  future: Prefs.getString("nome"),
      //   builder: (context, snapshot) {
      //     return Text(snapshot.hasData ? snapshot.data : "");
      //   },
      // ),
       accountName: Text(user.displayName ?? "" ),
      accountEmail: Text(user.email),
      currentAccountPicture: user.photoUrl != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
            )
          : CircleAvatar(
              child: Image.asset("assets/images/avatar.png"),
            ),
    );
  }
}
