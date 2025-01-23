# コンテンツが利用できないケースをメインケースと分離する

コンテンツが利用できないケースをメインのケースとコードブロックごと分離し、可読性を高めます。

## Overview

リストに表示するアイテムが0件になったり、サーバーとの通信エラーで取得できなかったりして表示すべきコンテンツが利用できないことがあります。  
このようなケースでは`.overlay`と`ContentUnavailableView`を使って主要なケースとコードブロックを分離することで可読性が高まります。

### コンテンツが利用できないケースを分離する

`ContentUnavailableView`のサンプルを見てみましょう。

```swift
struct ContentView: View {
    @ObservedObject private var viewModel = ContactsViewModel()


    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.searchResults) { contact in
                    NavigationLink {
                        ContactsView(contact)
                    } label: {
                        Text(contact.name)
                    }
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $viewModel.searchText)
            .overlay {
                if searchResults.isEmpty {
                    ContentUnavailableView.search
                }
            }
        }
    }
}
```

ここではリスト上にアイテムが1件以上存在するメインケースと、検索結果が0件だった場合のケースを`.overlay`で分離しています。  
これによりメインケースのコードブロックではメインケース自身のレイアウトに集中することができます。

また、検索結果が空の場合だけでなく、通信がエラーになるなどコンテンツが利用できない理由が複数存在することも考えられます。  
その場合でも`.overlay`のブロックでハンドリングに集中することでメインケースのコードブロックの肥大化を防げます。
