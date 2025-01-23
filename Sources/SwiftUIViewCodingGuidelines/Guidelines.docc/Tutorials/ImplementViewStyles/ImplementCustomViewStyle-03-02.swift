import SwiftUI

struct FruitLabelStyleEnvironmentKey: EnvironmentKey {
    typealias Value = any FruitLabelStyle
    static var defaultValue: any FruitLabelStyle = .default
}

extension EnvironmentValues {
    var fruitLabelStyle: any FruitLabelStyle {
        get {
            self[FruitLabelStyleEnvironmentKey.self]
        }
        set {
            self[FruitLabelStyleEnvironmentKey.self] = newValue
        }
    }
}
