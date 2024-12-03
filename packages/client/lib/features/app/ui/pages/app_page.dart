import 'package:flutter/material.dart';
import 'package:mind_palace_client/features/editor/ui/widgets/editor_panel.dart';
import 'package:mind_palace_client/features/navigation/ui/widgets/navigation_panel.dart';
import 'package:mind_palace_client/features/tabs/ui/widgets/tabs_panel.dart';
import 'package:mind_palace_client/utils/multi_widget/multi_widget.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 300,
            child: NavigationPanel(),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: TabsPanel(),
                ),
                Expanded(
                  child: EditorPanel(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
