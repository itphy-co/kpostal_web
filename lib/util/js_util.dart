import 'dart:async';

import 'package:js/js_util.dart' as js;

class JsUtil {
  void eval(String javascriptCode) {
    js.callMethod(js.globalThis, 'eval', [javascriptCode]);
  }

  void consoleLog(String log) {
    eval("console.log('$log');");
  }

  void call({
    Object? object,
    required String methodName,
    List<Object?> args = const [],
  }) {
    object ??= js.globalThis;
    js.callMethod(object, methodName, args);
  }

  Future<void> importUrl({
    required String url,
  }) async {
    final completer = Completer();
    js.setProperty(js.globalThis, 'onLoadScript', js.allowInterop(() async {
      completer.complete();
    }));

    String jsCode = '''
var script = document.createElement('script');
script.src = '$url';
script.onload = function() {
  window.onLoadScript();
};
document.head.appendChild(script);
    ''';
    eval(jsCode);

    return completer.future;
  }
}
