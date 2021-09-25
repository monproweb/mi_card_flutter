import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:yaru_icons/widgets/yaru_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.themeChanged}) : super(key: key);

  final void Function(String themeName) themeChanged;

  @override
  // ignore: no_logic_in_create_state
  _HomePageState createState() => _HomePageState(themeChanged);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.themeChanged);

  var themeName = 'Yaru-light';
  final void Function(String themeName) themeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          child: Icon(themeName.contains('-light')
              ? Icons.dark_mode
              : Icons.light_mode),
          onPressed: () => {
            setState(() {
              if (themeName.contains('-light')) {
                themeName = 'Yaru-dark';
              } else if (themeName.contains('-dark')) {
                themeName = 'Yaru-light';
              }
              themeChanged(themeName);
            })
          },
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/thomas.jpeg'),
          ),
          Text('Thomas Erhel', style: Theme.of(context).textTheme.headline4),
          Text('FLUTTER DEVELOPER',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: yaru.Colors.canonicalAubergine,
            ),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
                leading: const Icon(YaruIcons.globe),
                title: Text('monproweb.io',
                    style: Theme.of(context).textTheme.bodyText1)),
          ),
          Card(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
                leading: const Icon(YaruIcons.mail_send),
                title: Text('thomas.erhel@gmail.com',
                    style: Theme.of(context).textTheme.bodyText1)),
          )
        ]),
      ),
    );
  }
}
