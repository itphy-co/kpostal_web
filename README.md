# About kpostal_web

"kpostal_web" was created inspired by "kpostal."
Since "kpostal" does not support the web, you can use "kpostal_web" in Flutter web.

# Example
```dart
import 'package:flutter/material.dart';
import 'package:kpostal_web/widget/kakao_address_widget.dart';

class KakaoAddressPage extends StatefulWidget {
  const KakaoAddressPage({super.key});

  @override
  State<KakaoAddressPage> createState() => _KakaoAddressPageState();
}

class _KakaoAddressPageState extends State<KakaoAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('주소용 페이지'),
      ),
      body: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text(
                  '오른쪽 KakaoAddressWidget이 위젯트리 내에서 잘 동작됩니다.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: KakaoAddressWidget(
              onComplete: (kakaoAddress) {
                print('onComplete KakaoAddress: $kakaoAddress');
              },
              onClose: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

```