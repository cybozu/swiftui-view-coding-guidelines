import SwiftUI

protocol FruitLabelStyle {
    associatedtype Body: View
    @ViewBuilder func makeBody(configuration: FruitLabelConfiguration) -> Body
}

struct FruitLabelConfiguration {
    var title: String
}
