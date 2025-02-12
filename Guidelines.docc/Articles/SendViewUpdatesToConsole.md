# Viewのアップデートをコンソールに出力する

`._printChanges()`でViewのアップデートをコンソールに出力します。

## Overview
`Self._printChanges()`を呼び出してViewのアップデートをコンソールに出力できます。

```swift
var body: some View {
    let _ = Self._printChanges()
    // View code 
}
```

`._printChanges()`はどのプロパティがビューの更新を引き起こしたかを記録し、その情報をコンソールに送信します。

## See Also

- [Debugging an App Playground using the Console - Understand when and why your views change](https://developer.apple.com/documentation/swift-playgrounds/console-print-debugging#Understand-when-and-why-your-views-change)
