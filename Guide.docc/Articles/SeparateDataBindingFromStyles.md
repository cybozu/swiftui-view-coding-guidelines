# データバインディングとスタイリングを分離する

データバインディングを含むViewを`Configuration`に含めることで、データバインディングとスタイリングを分離します。

## Overview
`Configuration`は


```swift
enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct ContentView: View {
    @State var selectedFlavor: Flavor = .chocolate

    var body: some View {
        List {
            FlavorSelectSection(selectedFlavor: selectedFlavor)
        }
    }
}

struct FlavorSelectSection: View {
    @Binding var selectedFlavor: Flavor

    var body: some View {
        Section {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
        }
    }
}
```

ここで`FlavorSelectSection`のスタイリングを分離してみます。

```swift
protocol SelectSectionStyle {
    associatedtype Body
    func _body(configuration: Picker) -> Body
}

struct MySelectSectionStyle: SelectSectionStyle {
    func _body(configuration: Picker) -> some View {
        Section {
            configuration
        }
    }
}

struct FlavorSelectSection: View {
    @Binding var selectedFlavor: Flavor

    var body: some View {
        MySelectSectionStyle()._body(configuration: Picker("Flavor", selection: $selectedFlavor) {
            Text("Chocolate").tag(Flavor.chocolate)
            Text("Vanilla").tag(Flavor.vanilla)
            Text("Strawberry").tag(Flavor.strawberry)
        })
    }
}
```

これにより、同じスタイルを異なる型のデータを使ったPickerにも同じスタイルを適用できます。

```swift
enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

struct ToppingSelectSection: View {
    @Binding var selectedTopping: Flavor

    var body: some View {
        MySelectSectionStyle()._body(configuration: Picker("Flavor", selection: $selectedTopping) {
            Text("Nuts").tag(Topping.nuts)
            Text("Cookies").tag(Topping.cookies)
            Text("Blueberries").tag(Topping.blueberries)
        })
    }
}
```
