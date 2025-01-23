# ユーザー入力はユーザーのもの

ユーザーが入力した値はユーザーの持ち物として扱います。

## Overview

`Binding(get:set:)`を使って入力された値を変更することができます。  
これはユーザー入力を加工するのにも使えますが、使いどころには注意が必要です。

### システムの制約を提示する

ユーザーが入力した値はユーザーが保存、変更、削除できるべきですが、例えば文字数上限などシステム上の制約で難しいケースがあります。  
この場合、ユーザー入力値は変更せず、エラーメッセージを表示する、修正後の値を選択肢として提示する、などの方法でユーザーに修正してもらうのが良い方法です。

### 書式の揺れを吸収する

一方で、半角と全角やハイフンの有無など書式の揺れが存在するものもあります。
システムが受け入れる書式とユーザーが入力した書式が一致するとは限りませんし、ただ書式を修正するだけの作業はユーザーにとって本質的ではありません。  
この場合は表記揺れを吸収するために入力値を変更するのが良いでしょう。


```swift
struct ContentView: View {
    @State var text: String = ""

    var body: some View {
        TextField("phone number", text: Binding<String>(
            get: { text },
            set: { text = String($0.removeHyphens().convert(.fullWidthToHalfWidth)) }
        ))
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}
```

> `.onChange(of: text, perform: {})`の`perform`で変更すると変更後にもう一度`.onChange`が発火するため、`Binding(get:set:)`で実装します。
