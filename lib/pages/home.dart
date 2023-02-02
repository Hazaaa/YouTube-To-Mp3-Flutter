import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Center(
        child: Observer(
          builder: (_) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(
                bottom: !store.convertingInProgress ? 0 : size.height * 0.7),
            child: Input(),
          ),
        ),
      ),
    );
  }
}
