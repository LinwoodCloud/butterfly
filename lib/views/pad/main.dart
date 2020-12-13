import 'package:butterfly/widgets/split/core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainView extends StatefulWidget {
  final bool expanded;
  final SplitView view;
  final SplitWindow window;

  const MainView({Key key, this.expanded, this.view, this.window}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

enum Tool { view, select, move, edit }

class _MainViewState extends State<MainView> {
  Tool currentTool = Tool.view;

  void _toggleTool(Tool tool) => setState(() => currentTool = currentTool == tool ? null : tool);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(children: [
              Expanded(child: Center(child: FlutterLogo(size: 256))),
              Container(
                  color: Theme.of(context).canvasColor,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        IconButton(
                          icon: Icon(MdiIcons.cursorDefaultOutline),
                          color: currentTool == Tool.view ? Theme.of(context).primaryColor : null,
                          onPressed: () => _toggleTool(Tool.view),
                        ),
                        IconButton(
                          icon: Icon(MdiIcons.select),
                          color: currentTool == Tool.select ? Theme.of(context).primaryColor : null,
                          onPressed: () => _toggleTool(Tool.select),
                        ),
                        IconButton(
                          icon: Icon(MdiIcons.cursorMove),
                          color: currentTool == Tool.move ? Theme.of(context).primaryColor : null,
                          onPressed: () => _toggleTool(Tool.move),
                        ),
                        IconButton(
                          icon: Icon(MdiIcons.pencilOutline),
                          color: currentTool == Tool.edit ? Theme.of(context).primaryColor : null,
                          onPressed: () => _toggleTool(Tool.edit),
                        ),
                        VerticalDivider(),
                        if (currentTool == Tool.view) ...[
                          IconButton(
                            icon: Icon(MdiIcons.cubeOutline),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(MdiIcons.tuneVertical),
                            onPressed: () {},
                          ),
                          IconButton(
                              icon: Icon(widget.expanded
                                  ? MdiIcons.windowMinimize
                                  : MdiIcons.windowMaximize),
                              onPressed: widget.expanded
                                  ? Navigator.of(context).pop
                                  : () => widget.window.expand(context, widget.view, widget.window))
                        ]
                      ])))
            ])));
  }
}