import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Banner sample'),
        ),

        /// ✨✨SnackBarと同様にMaterialBannerも、既にbuildの中でScaffoldを利用している場合、Builderが必要。
        /// (微妙にハマりポイントかもしれない)
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                child: const Text('Show MaterialBanner'),
                onPressed: () =>
                    ScaffoldMessenger.of(context).showMaterialBanner(
                  /// ✨✨sdkが2.14以上でないと呼び出せないので注意
                  MaterialBanner(
                    content: const Text('Hello, I am a Material Banner'),
                    leading: const Icon(Icons.info),
                    backgroundColor: Colors.orange,
                    actions: [
                      TextButton(
                        child: const Text('Dismiss'),
                        onPressed: () => ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
