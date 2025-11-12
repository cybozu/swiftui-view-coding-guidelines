# ContentUnavailableViewを拡張して空状態を表現する

`ContentUnavailableView`を拡張して、アプリケーション内で再利用可能な空状態のビューを定義します。

## Overview
`ContentUnavailableView`はコンテンツが利用できない場合に表示するビューを提供します。  
`ContentUnavailableView`には型パラメータがあるため、`extension`で`static`なプロパティやメソッドを追加する場合にはconcreteな型を確定させるために少し工夫が必要です。

## `ContentUnavailableView`の拡張
受信メールの一覧が空の場合を表現するために`ContentUnavailableView`を拡張する例を見てみましょう。
`MailListUnavailableContent`という型を定義し、`ContentUnavailableView`の型パラメータに対応する型エイリアスを追加します。

```swift
public struct MailListUnavailableContent {
    public typealias Label = SwiftUI.Label<Text, Image>
    public typealias Description = Text
    public typealias Actions = EmptyView
}
```

次に、`MailListUnavailableContent`の型エイリアスを使用して具体的な型を指定し、`ContentUnavailableView`を拡張します。

```swift
public struct MailListUnavailableContent {
    public typealias Label = SwiftUI.Label<Text, Image>
    public typealias Description = Text
    public typealias Actions = EmptyView
}

extension ContentUnavailableView
where Label == MailListUnavailableContent.Label,
      Description == MailListUnavailableContent.Description,
      Actions == MailListUnavailableContent.Actions
{
    public static func mailList() -> Self {
        Self("メールなし", systemImage: "tray")
    }
}
```

これで、`ContentUnavailableView.mailList()`を呼び出すことで、受信メールの一覧が空の場合のビューを簡単に作成できるようになります。

```swift
struct MailListView: View {
    var emails: [Email] = []

    var body: some View {
        List(emails) { email in
            Text(email.subject)
        }
        .overlay {
            if emails.isEmpty {
                ContentUnavailableView.mailList()
            }
        }
    }
}
```

## See Also

- <doc:SeparateContentUnavailableCases>
- [ContentUnavailableView - Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/contentunavailableview)
