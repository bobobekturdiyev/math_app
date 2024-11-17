import 'package:flutter/cupertino.dart';

class WCupertinoSwitch extends StatefulWidget {
  final Function(bool value) onChanged;
  const WCupertinoSwitch({super.key, required this.onChanged});

  @override
  State<WCupertinoSwitch> createState() => _WCupertinoSwitchState();
}

class _WCupertinoSwitchState extends State<WCupertinoSwitch> {
  bool _value=false;
  @override
  Widget build(BuildContext context) {
    return  CupertinoSwitch(
      value: _value,
      onChanged: (value){
        setState(() {
          _value=value;
        });
        widget.onChanged(value);
      },
    );
  }
}
