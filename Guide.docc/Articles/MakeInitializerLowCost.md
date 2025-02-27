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

### `.task`でイニシャライザのコストを下げる
xxx
