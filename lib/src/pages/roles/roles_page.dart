import 'package:flutter/material.dart';
import 'package:udemy_flutter_delivery/src/models/Role.dart';
import './roles_controller.dart';

class RolesPage extends StatelessWidget {
  RolesController con = RolesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Pilih role',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07),
            child: ListView(
                children: con.user.roles != null
                    ? con.user.roles!.map((Role role) {
                        return _cardRole(role);
                      }).toList()
                    : []),
          ),
        ));
  }

  Widget _cardRole(Role role) {
    return GestureDetector(
      onTap: () => con.goToPageRole(role),
      child: Column(
        children: [
          Container(
            height: 140,
            width: 185,
            child: FadeInImage(
              image: NetworkImage(role.image!),
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 50),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${role.name!} Role Id:(${role.id})',
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
