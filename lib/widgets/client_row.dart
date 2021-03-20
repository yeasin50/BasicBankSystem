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
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: double.infinity,
        child: ListTile(
          tileColor: Colors.transparent,
          onTap: () {
            // log("On Tap: ${value.clients[index]!.name}");
            ///`for single value we arent doing map`
            Navigator.of(context)
                .pushNamed(ClientProfile.routeName, arguments: index);
          },
          leading: Hero(
            tag: "rowItem" + index.toString(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  value.clients[index]!.imagePath,
                  fit: BoxFit.cover,
                )),
          ),

          title: Text(value.clients[index]!.name),
          // subtitle: Text(value.clients[index]!.phone),
          trailing: Text(""),
        ),
      ),
    );
  }
}
