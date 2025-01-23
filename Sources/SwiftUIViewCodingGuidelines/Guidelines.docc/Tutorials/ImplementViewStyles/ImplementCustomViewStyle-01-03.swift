import SwiftUI

struct DefaultFruitLabelStyle: FruitLabelStyle {
    func makeBody(configuration: FruitLabelConfiguration) -> some View {
        HStack {
            Text(configuration.title)
        }
    }
}
