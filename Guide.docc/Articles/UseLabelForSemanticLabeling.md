# ラベリングのためのコンポーネントにはLabelを使う

表示上テキストやアイコンのみになる場合でもラベリングのためのコンポーネントには`Label`を用い、`labelStyle`で表現を変更します。

## Overview

`Button`や`Menu`など、SwiftUIの多くのコンポーネントはラベルをクロージャで受け取ります。  
`Label`を用いてタイトルとアイコンの両方を記述することで、VoiceOverに適切な情報を提供します。

表示上はテキストだけ、あるいはアイコンだけが必要な場合でも、`Text`や`Image`を直接渡すのではなく`Label`を使って`labelStyle`で表現を制御する方が望ましいです。

## TextやImageを直接使う場合

`Button`に`Text`や`Image`を直接渡すと、記述されていない側の情報がVoiceOverに提供されません。

```swift
// テキストのみ
Button {
    save()
} label: {
    Text("Save")
}

// アイコンのみ
Button {
    save()
} label: {
    Image(systemName: "square.and.arrow.down")
}
```

アイコンのみの`Button`ではVoiceOverがアイコン名をそのまま読み上げてしまうことがあり、ユーザーにとってわかりにくくなります。

## Labelを使いlabelStyleで表現を変更する

`Label`を使ってタイトルとアイコンの両方を記述し、表示は`labelStyle`で制御します。

```swift
// テキストのみの表示
Button {
    save()
} label: {
    Label("Save", systemImage: "square.and.arrow.down")
        .labelStyle(.titleOnly)
}

// アイコンのみの表示
Button {
    save()
} label: {
    Label("Save", systemImage: "square.and.arrow.down")
        .labelStyle(.iconOnly)
}
```

表示上はアイコンだけであってもVoiceOverは`Label`のタイトルを読み上げるため、ユーザーに意味が伝わります。

`Menu`でも同様です。

```swift
Menu {
    // menu items
} label: {
    Label("Actions", systemImage: "ellipsis.circle")
        .labelStyle(.iconOnly)
}
```

表示上の都合で`Text`や`Image`を直接使うのではなく、`Label`を使って意味を記述し`labelStyle`で表現を分離することで、アクセシビリティとスタイリングの両方を適切に扱えます。

## See Also
- <doc:SeparatingStylingResponsibilities>
