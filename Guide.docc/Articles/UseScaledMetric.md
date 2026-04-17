# ScaledMetricを使う

Dynamic Typeに対応するため、フォントサイズやレイアウトの値をScaledMetricで指定します。

## Overview

テキストのフォントサイズはDynamic Typeによって自動的にスケーリングされますが、アイコンのサイズやスペーシングなどの数値はそのままでは追従しません。  
`@ScaledMetric`を使うことで、これらの数値もDynamic Typeの設定に応じてスケーリングされるようになります。

以下の例では、アイコンのサイズに固定値を使用しています。

```swift
struct ProfileView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
            Text("ユーザー名")
        }
    }
}
```

この場合、ユーザーがDynamic Typeで文字サイズを大きくしてもアイコンのサイズは40ptのまま変わらないため、テキストとのバランスが崩れてしまいます。

### @ScaledMetricで数値をスケーリングする

`@ScaledMetric`を使うことで、数値がDynamic Typeの設定に連動してスケーリングされます。

```swift
struct ProfileView: View {
    @ScaledMetric var iconSize: CGFloat = 40

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: iconSize, height: iconSize)
            Text("ユーザー名")
        }
    }
}
```

これにより、ユーザーが文字サイズを変更した際にアイコンのサイズも追従し、レイアウトのバランスが保たれます。

### 基準となるText Styleを指定する

`@ScaledMetric(relativeTo:)`で基準となる`TextStyle`を指定できます。  
隣接するテキストのスタイルに合わせることで、テキストと同じ比率でスケーリングされ、サイズ変化時のバランスが保たれます。

```swift
struct ProfileView: View {
    @ScaledMetric(relativeTo: .headline) var iconSize: CGFloat = 40

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: iconSize, height: iconSize)
            Text("ユーザー名")
                .font(.headline)
        }
    }
}
```

## See Also

- [ScaledMetric - Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/scaledmetric)
