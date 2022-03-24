import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safecode/shortcuts_utilities/increment_intent.dart';

Map<ShortcutActivator, Intent> shortcutEnterPressed() {
  return <ShortcutActivator, Intent>{
    LogicalKeySet(LogicalKeyboardKey.enter): const IncrementIntent(),
  };
}

Map<Type, Action<Intent>> shortcutExecute(Function function, {List? args}) {
  return <Type, Action<Intent>>{
    IncrementIntent: CallbackAction<IncrementIntent>(
        onInvoke: (IncrementIntent intent) => args == null ? function() : function(args))
  };
}
