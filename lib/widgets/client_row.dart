import 'dart:developer';

import 'package:bank_app_social/models/client.dart';
import 'package:flutter/material.dart';

class ClientRow extends StatelessWidget {
  final Client? client;
  ClientRow(this.client);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          log("On Tap: ${client!.name}");
        },
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(client!.name),
      ),
    );
  }
}
