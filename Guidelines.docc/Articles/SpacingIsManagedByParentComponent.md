# 余白は親コンポーネントが決める

要素同士の配置によって決まる余白は親コンポーネントで指定します。

## Overview

要素同士の間隔は配置する親コンポーネントが指定し、子コンポーネント内には含めないようにします。

以下の例では親コンポーネントが`spacing`, `padding`を指定し、子コンポーネントでは余白の`padding`を付与していません。

```swift
struct Parent: View {
    var body: some View {
        HStack(spacing: 4) {
            Child()
            Child()
            Child()
        }
        .padding(.trailing, 8)
    }
}

struct Child: View {
    var body: some View {
        Text("child")
    }
}
```

親コンポーネントで余白を指定することで子コンポーネントの実装を確認することなく余白を決定できるため、再利用性が高まります。

### `background`のために`padding`を使う

子コンポーネントで`padding`を効果的に利用する例として、`background`を使う場合が挙げられます。

```swift
struct Child: View {
    var body: some View {
        Text("child")
            .padding(4)
            .background(.red)
    }
}
```

このケースでは`background`の外側に余白はないので、再利用性は保たれています。
