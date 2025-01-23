# Viewのスタイル変更は値の変更で行う

条件によってViewのスタイルを変更する場合は値を変更します。

## Overview

条件によってViewのスタイルを変更する場合、不要な再描画を発生させないよう注意する必要があります。  
`if`によるView全体の切り替えはコード上で表現される通りView全体が差し替えられます。  
これは全体を完全に再描画することになり、本来不要な計算コストが発生します。

### 値の変更でスタイルを切り替える

単純なスタイルの変更の場合、三項演算子で値の変更を行います。

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello!")
            .foregroundStyle(condition ? .teal : .red)
    }
}
```

三項演算子で表現が難しい場合は関数などを用いて値を変更します。

```swift
enum TrafficSignal {
    case go
    case caution
    case stop
}
```
```swift
extension TrafficSignal {
    var lightColor: some ShapeStyle {
        switch self {
        case .go:      Color.green
        case .caution: Color.yellow
        case .stop:    Color.red
        }
    }
}
```
```swift
struct ContentView: View {
    @State var signal: TrafficSignal

    var body: some View {
        Text("Hello!")
            .foregroundStyle(signal.lightColor)
    }
}
```
