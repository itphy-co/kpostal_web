import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js;
import 'package:kpostal_web/model/kakao_address.dart';
import 'package:kpostal_web/util/js_util.dart';

class KakaoAddressWidget extends StatefulWidget {
  final ValueChanged<KakaoAddress> onComplete;
  final VoidCallback onClose;

  const KakaoAddressWidget({
    super.key,
    required this.onComplete,
    required this.onClose,
  });

  @override
  _KakaoAddressWidgetState createState() => _KakaoAddressWidgetState();
}

class _KakaoAddressWidgetState extends State<KakaoAddressWidget> {
  late html.DivElement divElement;

  @override
  void initState() {
    super.initState();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'div-layer',
      (int viewId) {
        final divElement = html.DivElement();
        divElement.id = 'layer';
        divElement.style.display = 'none';
        divElement.style.position = 'fixed';
        divElement.style.overflow = 'hidden';
        divElement.style.zIndex = '1';
        //
        // final imgElement = html.ImageElement();
        // imgElement.src = '//t1.daumcdn.net/postcode/resource/images/close.png';
        // imgElement.id = 'btnCloseLayer';
        // imgElement.style.cursor = 'pointer';
        // imgElement.style.position = 'absolute';
        // imgElement.style.right = '-3px';
        // imgElement.style.top = '-3px';
        // imgElement.style.zIndex = '1';
        // imgElement.alt = '닫기 버튼';
        // imgElement.onClick.listen((event) {
        //   // closeDaumPostcode();
        // });
        //
        // divElement.append(imgElement);
        return divElement;
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final jsUtil = JsUtil();
      await jsUtil.importUrl(
          url: '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js');

      try {
        js.setProperty(
            js.globalThis, 'onSelectAddress', js.allowInterop(onComplete));
      } catch (e) {}
      const jsCode = r'''
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');
    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                onSelectAddress(data);
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';
    }
    ''';
      jsUtil.eval(jsCode);
      jsUtil.call(methodName: 'sample2_execDaumPostcode');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(viewType: 'div-layer');
  }

  void onComplete(dynamic data) {
    widget.onClose();
    widget.onComplete(KakaoAddress.fromJson(js.dartify(data) as Map));
  }
}
