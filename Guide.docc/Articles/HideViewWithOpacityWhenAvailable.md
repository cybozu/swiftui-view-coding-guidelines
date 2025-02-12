# 利用できる時はopacityでViewを隠す

レイアウト上選択できる場合は`.opacity(_:)`でViewを隠します。

## Overview

Viewを条件によって隠す必要がある場合に選択肢が複数あります。  
`.opacity(_:)`を使うと三項演算子でViewを隠すことができるため、`.hidden()`より効率が良くなります。

```swift
var body: some View {
    Text("Hello World")
        .opacity(condition ? 0 : 1)
}
```

> <doc:ChangeValueWhenSwitchingStyle>

ただし、レイアウト上の必要性を考慮して`if`文での切り替えを選択する場合があります。

### 他のViewの配置への影響を考慮する
`.opacity(_:)`によるViewの削除は、他のViewの配置へ影響を与えません。

例えば、`VStack`の中で`.opacity(_:)`による削除を行なった場合、表示するために確保されたスペースは削除後も確保されたままとなります。  
ユーザー名とパスワードを入力するフォームでエラーメッセージを出す時に、エラーメッセージの有無で全体のレイアウトを変えない時などに利用します。

また、注文フォームで配送先と請求先に異なる住所を使用することを選択した場合に、2つ目の住所フィールドを表示することもできます。  
住所欄のようなスクロールが必要なコンテンツには、`if`文を使用してコンテンツが表示されているときだけスペースを確保し、他のコンテンツは表示状態に従って移動するようにします。


> [Choosing the right way to hide a view](https://developer.apple.com/tutorials/swiftui-concepts/choosing-the-right-way-to-hide-a-view)
