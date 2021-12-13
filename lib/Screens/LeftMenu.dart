import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(''),
          ),

          LeftMenuItem(
            title: 'Anasayfa',
            leading: const Icon(Icons.home),
            route: '/home',
          ),
          LeftMenuItem(
            title: 'Çıkış Yap',
            leading: const Icon(Icons.exit_to_app),
            route: '/log-out',
          ),
        ],
      ),
    );
  }
}

class LeftMenuItem extends StatelessWidget {
  String? title, subTitle;
  Widget? leading, trailing;
  String route = '/';

  LeftMenuItem(
      {Key? key,
      this.title,
      this.subTitle,
      this.leading,
      this.trailing,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? ''),
      subtitle: Text(subTitle ?? ''),
      leading: leading,
      trailing: trailing,
      onTap: () {
        Navigator.pushReplacementNamed(context, this.route);
      },
    );
  }
}
