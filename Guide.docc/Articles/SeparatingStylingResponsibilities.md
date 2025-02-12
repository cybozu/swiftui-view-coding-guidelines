# スタイリングの責務を分離する

ユーザーインタラクション上の責務とスタイリングの責務を分離します。

## Overview

SwiftUIでは組み込みのスタイルが定義され、プレゼンテーションコンテキストに適切なスタイルが自動で選択されます。  
例えば、`Label`はプラットフォームやツールバーに表示されるかどうかなどの要因によって、アイコン、文字列のタイトル、またはその両方として表示されるかもしれません。
ユーザーインタラクション上`Label`であることと、表示上のスタイルがどのような表現になるかが分離されています。

## 組み込みのスタイルを使う

組み込みのスタイルを使って`Label`の表現を見てみます。

```swift
Label("Fire", systemImage: "flame.fill")
    .labelStyle(.automatic)
```

`.autoatic`は`DefaultLabelStyle`として定義され、`labelStyle`を指定しない場合にも適用されます。  
明示的にスタイルを変更する場合は目的のスタイルを指定します。

```swift
Label("Fire", systemImage: "flame.fill")
    .labelStyle(.iconOnly)
```

`.iconOnly`を指定するとアイコンのみが表示されます。一方、ソースコード上では`View`のユーザーインタラクション上の責務は`Label`であることが表現されています。

## 自作のスタイルを使う
自作のスタイルを使ってユーザー定義の`View`でも同様のことができます。
例えば、フルーツの一覧を作成してみましょう。

```swift
struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

let fruits = [
    Fruit(name: "apple"),
    Fruit(name: "banana"),
    Fruit(name: "cherry")
]
```

一覧をリストで表示する場合:

```swift
struct FruitList: View {
    var body: some View {
        List(fruits) { fruit in
            NavigationLink {
                FruitDetail(fruit)
            } label: {
                FruitLabel(fruit)
                    .fruitLabelStyle(.fruitList)
            }
        }
    }
}
```

一覧をグリッドで表示する場合:

```swift
struct FruitGrid: View {
    var body: some View {
        Grid {
            GridRow {
                ForEach(fruits) { fruit in
                    FruitLabel(fruit)
                        .fruitLabelStyle(.fruitGrid)
                }
            }
        }
    }
}
```

リストとグリッドでは画面上の表現は異なりますが、`FruitLabel`は共通しています。
このようにスタイリングの責務を`.fruitLabelStyle`に分離することができます。

## See Also
- <doc:ImplementViewStylesTableofContents>
