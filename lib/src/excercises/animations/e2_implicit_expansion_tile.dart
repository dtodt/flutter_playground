import 'package:flutter/material.dart';

const _kDefaultExpandTime = Duration(milliseconds: 200);
const _kDefaultScrollTime = Duration(milliseconds: 800);
const _kDefaultTitle = 'My expansion tile';
const _kDefaultDescription = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
''';

///
class PanelContent {
  final String title;
  final String description;

  const PanelContent({
    required this.title,
    required this.description,
  });

  factory PanelContent.fromIndex(int index) => PanelContent(
        title: '$_kDefaultTitle $index',
        description: _kDefaultDescription,
      );
}

class E2ImplicitExpansionTile extends StatefulWidget {
  const E2ImplicitExpansionTile({super.key});

  @override
  State<E2ImplicitExpansionTile> createState() =>
      _E2ImplicitExpansionTileState();
}

class _E2ImplicitExpansionTileState extends State<E2ImplicitExpansionTile> {
  final ScrollController _controller = ScrollController();

  final int _itemCount = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My scroll view')),
      body: SafeArea(
        child: ListView.builder(
          controller: _controller,
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            final content = PanelContent.fromIndex(index);

            return ImplicitExpansionTile(
              onExpand: () => _onExpand(index),
              title: content.title,
              child: Column(
                children: [
                  const FlutterLogo(size: 50.0),
                  Text(content.description),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onExpand(int index) {
    final contentSize = _controller.position.viewportDimension +
        _controller.position.maxScrollExtent;
    final target = contentSize * index / _itemCount;
    _controller.position.animateTo(
      target,
      duration: _kDefaultScrollTime,
      curve: Curves.easeInOut,
    );
  }
}

class ImplicitExpansionTile extends StatefulWidget {
  final String title;
  final Widget child;
  final VoidCallback onExpand;

  const ImplicitExpansionTile({
    super.key,
    required this.title,
    required this.child,
    required this.onExpand,
  });

  @override
  State<ImplicitExpansionTile> createState() => _ImplicitExpansionTileState();
}

class _ImplicitExpansionTileState extends State<ImplicitExpansionTile> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTileHead(
          open: open,
          onTap: _onTap,
          title: widget.title,
        ),
        ExpansionTileBody(
          open: open,
          child: widget.child,
        ),
      ],
    );
  }

  void _onTap() {
    if (!open) {
      widget.onExpand();
    }
    setState(() {
      open = !open;
    });
  }
}

class ExpansionTileHead extends StatelessWidget {
  final bool open;
  final VoidCallback onTap;
  final String title;

  const ExpansionTileHead({
    Key? key,
    required this.open,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = open ? Colors.blue : Colors.black;
    final turns = open ? 0.5 : 0.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedDefaultTextStyle(
                duration: _kDefaultExpandTime,
                style: TextStyle(color: color),
                child: Text(title),
              ),
              AnimatedRotation(
                turns: turns,
                duration: _kDefaultExpandTime,
                child: Icon(
                  Icons.expand_more,
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTileBody extends StatelessWidget {
  final bool open;
  final Widget child;

  const ExpansionTileBody({
    Key? key,
    required this.open,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final factor = open ? 1.0 : 0.0;
    return ClipRect(
      child: AnimatedAlign(
        alignment: Alignment.center,
        curve: Curves.easeIn,
        duration: _kDefaultExpandTime,
        heightFactor: factor,
        child: child,
      ),
    );
  }
}
