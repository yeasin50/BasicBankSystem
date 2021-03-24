import 'package:bank_app_social/provider/client_provider.dart';
import 'package:bank_app_social/screens/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          color: Colors.grey.withOpacity(.3),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: double.infinity,
        child: ListTile(
          tileColor: Colors.transparent,
          onTap: () async {
            // log("On Tap: ${value.clients[index]!.name}");
            ///let's just use provider
            final provider =
                Provider.of<ClientProvider>(context, listen: false);
            await provider.setcurrentUser(index!);

            ///`for single value we arent doing map`
            Navigator.of(context)
                .pushNamed(ClientProfile.routeName, arguments: index);
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
                tag: "rowItem" + index.toString(),
                child: Image.asset(
                  value.clients[index]!.imagePath,
                  fit: BoxFit.cover,
                )),
          ),

          title: Text(value.clients[index]!.name,
              style: GoogleFonts.lato(
                color: Colors.white,
              )),
          // subtitle: Text(value.clients[index]!.phone),
          trailing: Text(
            value.clients[index]!.balance.toString(),
            style: GoogleFonts.varela(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
