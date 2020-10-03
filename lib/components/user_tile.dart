import 'package:fitsheet/models/user.dart';
import 'package:fitsheet/provider/users.dart';
import 'package:fitsheet/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context, listen: true);
    final avatar = user.avatar == null || user.avatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatar));
    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.telefone),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.yellow,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Atenção!"),
                    content: Text("Deseja realmente excluir este item?"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Não'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Sim'),
                      ),
                    ],
                  ),
                ).then((confirmed) => {
                      if (confirmed)
                        {
                          Provider.of<Users>(context, listen: false)
                              .remove(user)
                        }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
