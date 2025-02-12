# Proxyを通じてContent Viewにアクセスする

Container ViewからContent Viewの値を取得したり、Content Viewの操作を行う際はProxyを提供します。

## Overview

Container Viewで任意のコンテンツに対して実行中の値を取得したり、programmaticallyに操作を行いたいことがあります。  
この時`Proxy`を提供することで利用側は任意のタイミングでアクセスできます。  
標準では[`GeometryReader`](https://developer.apple.com/documentation/swiftui/geometryreader)や[`ScrollViewReader`](https://developer.apple.com/documentation/swiftui/scrollviewreader)で行われています。

### Proxyを通じてprogrammaticallyにContent Viewを操作する

[WebUI](https://github.com/cybozu/WebUI)の例を見てみましょう。

```swift
struct ContentView: View {
    var body: some View {
        WebViewReader { proxy in
            WebView()
                .onAppear {
                    proxy.load(request: URLRequest(url: URL(string: "https://www.example.com")!))
                }
        }
        .padding()
    }
}
```

`WebView`の`load`をprogrammaticallyに行うために、`proxy`が提供されています。  
この場合、`WebView`の構築が終わった後に特定のURLを`load`したいので、`onAppear`のタイミングで`load`を発火するために`proxy`を使っています。
