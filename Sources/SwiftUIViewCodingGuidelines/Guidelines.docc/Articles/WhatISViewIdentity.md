# View Identityとは
View Identityとは何かと、その種類について説明します。

## Overview
View IdentityはSwiftUIがアプリ内での複数回の更新をまたいで同じもしくは異なる要素を認識する方法です。

> Demystify SwiftUI - WWDC21 - [01:06~](https://developer.apple.com/videos/play/wwdc2021/10022/?time=66)

View Identityは明示的に指定されるものと、View hierarchyの型構造によって決められるものの2種類あります。

### Explicit Identity
明示的に指定されるIdentityです。

[`.id(_:)`](https://developer.apple.com/documentation/swiftui/view/id(_:))や[`ForEach.init(_:id:content:)`](https://developer.apple.com/documentation/swiftui/foreach/init(_:id:content:)-82hm4)で指定するidが代表的です。

### Structural Identity
View hierarchyの型構造によって決められるIdentityです。

> Demystify SwiftUI - WWDC21 - [08:15~](https://developer.apple.com/videos/play/wwdc2021/10022/?time=495)

ViewBuilder内の型を解決した実行時の型情報が異なるViewごとに個別のIdentityが割り振られます。

```swift
var body: some View {
    VStack {
        Text("Hello")
        Text("World")
    }
}
```

ここでは2つの`Text`それぞれに個別のStructural Identityが割り振られています。これは引数の値`Hello`と`World`の差ではなく、型情報が使われています。

```swift
var body: some View {
    VStack {
        Text("Hello")
        Text("Hello")
    }
}
```

例えばこのように、引数の値を同じにしたとしてもそれぞれで別のStructural Identityが割り振られ、2つの`Text`として認識されます。
