# イニシャライザを低コストにする
Viewのイニシャライザは何度も呼び出されるため、低コストに保ちます。

## Overview
高コストなイニシャライザはよくあるパフォーマンス低下の原因です。

```swift
struct DogRootView: View {
  @State private var model = FetchModel()

  var body: some View {
    DogList(model.dogs)
  }
}

@Observable class FetchModel {
  var dogs: [Dog]

  init() {
    fetchDogs()
  }

  func fetchDogs() {
    // Takes a long time
  }
}
```

この例では`DogRootView`のイニシャライザで`FetchModel`がイニシャライズされます。  
`FetchModel`のイニシャライザで処理に時間のかかる`fetchDogs`が同期的に呼び出されているため、`DogRootView`のイニシャライザが高コストとなっています。

### task modifierでイニシャライザのコストを下げる
この場合は、`fetchDogs`を`async`にし、`.task`で非同期にデータを読み込むことでイニシャライザを低コストにします。

```swift
struct DogRootView: View {
  @State private var model = FetchModel()

  var body: some View {
    DogList(model.dogs)
      .task { await model.fetchDogs() }
  }
}

@Observable class FetchModel {
  var dogs: [Dog]

  init() { }

  func fetchDogs() async {
    // Takes a long time
  }
}
```

> WWDC23 Demystify SwiftUI performance [12:20~](https://developer.apple.com/videos/play/wwdc2023/10160/?time=740)
