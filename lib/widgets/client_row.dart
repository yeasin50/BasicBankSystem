import 'dart:developer';
import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientRow extends StatelessWidget {
  final int? index;
  ClientRow(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (_, value, __) => Container(
        child: ListTile(
          onTap: () {
            // log("On Tap: ${value.clients[index]!.name}");
            ///`for single value we arent doing map`
            Navigator.of(context)
                .pushNamed(ClientProfile.routeName, arguments: index);
          },
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(value.clients[index]!.name),
          // subtitle: Text(value.clients[index]!.phone),
          trailing: Text(""),
        ),
      ),
    );
  }
}
