# Viewの重ね合わせの実装を選択する

レイアウトのサイズが決定される状況に応じて、Viewの重ね合わせの実装を選択します。

## Overview

Viewの重ね合わせには`ZStack`と`.overlay`/`.background`を使うことができます。  
最終的なサイズを含まれる全ての子Viewの集計から決定する場合は、`ZStack`を選択します。
レイアウトのサイズがビュー1つだけで決まる場合は、modifierを選択します。  

### 重ね合わせにModifierを使う
例えば、以下のコードは`ProfileDetail`ビューを`Image`ビューに重ね合わせます。
```swift
struct ProfileViewWithOverlay: View {
    var body: some View {
        VStack {
            Image("ProfilePicture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(ProfileDetail(), alignment: .bottom)
        }
    }
}
```

## See Also
- [Building layouts with stack views - Add depth in alternative ways](https://developer.apple.com/documentation/swiftui/building-layouts-with-stack-views#Add-depth-in-alternative-ways)
