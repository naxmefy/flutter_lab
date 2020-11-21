import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '00050 Custom Keyboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Keyboard'),
        ),
        body: Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final _focusNode = FocusNode();
  final _valueNotifier = ValueNotifier<String>("Foo");

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _focusNode,
          footerBuilder: (_) => FooBarKeyboard(
            notifier: _valueNotifier,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _buildConfig(context),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyboardCustomInput<String>(
              focusNode: _focusNode,
              height: 65,
              notifier: _valueNotifier,
              builder: (context, val, hasFocus) {
                return Container(
                  alignment: Alignment.center,
                  color: hasFocus ? Colors.grey[300] : Colors.white,
                  child: Text(
                    val,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FooBarKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  final ValueNotifier<String> notifier;

  FooBarKeyboard({
    Key key,
    @required this.notifier,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Row(
        children: [
          _actionForValue("Foo"),
          _actionForValue("Bar"),
          _actionForValue("Baz"),
        ],
      ),
    );
  }

  Widget _actionForValue(String val) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
              width: 3.0,
            ),
          ),
          child: InkWell(
            onTap: () => updateValue(val),
            child: FittedBox(
              child: Text(
                val,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
