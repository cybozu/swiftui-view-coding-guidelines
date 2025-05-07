# 引数を持つmodifierを提供する

引数内で状態の条件分岐を記述できるよう、引数を持つmodifierを提供します。

## Overview

SwiftUIでは、条件に応じてViewの見た目や振る舞いを変更することがよくあります。引数のないmodifierを使用する場合、利用側は`if`文による条件分岐を使用するしかありませんが、これはView identityが変更され、パフォーマンスの低下を招きます。

引数を持つmodifierを提供することで、利用側はmodifierの引数の中で条件分岐を記述でき、View identityを保持したままmodifierを条件によって変更できます。

### 引数のないmodifierの問題点

引数のないmodifierを条件分岐によって切り替えるには、`if`文を使用する必要があります：

```swift
struct ContentView: View {
    @State var condition = false

    var body: some View {
        if condition {
            Text("nice")
                .nicelyStyled()
        } else {
            Text("nice")
        }
    }
}
```

この実装では、`condition`の値が変わるたびに、`Text`がView identityの異なるViewに再構築されます。これにより、状態変更のたびに完全な再構築が必要となり、パフォーマンスが低下します。

### 条件分岐をmodifierの引数に移動する

引数を持つmodifierを提供すると、条件分岐を引数に移動することで同一のView identityで表現できます：

```swift
struct ContentView: View {
    @State var condition = false

    var body: some View {
        Text("nice")
            .textStyle(condition ? .nicely : .primary)
    }
}
```
