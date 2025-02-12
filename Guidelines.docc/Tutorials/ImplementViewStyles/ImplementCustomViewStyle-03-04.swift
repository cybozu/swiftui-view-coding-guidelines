import SwiftUI

extension FruitLabel {
    func fruitLabelStyle(_ style: some FruitLabelStyle) -> some View {
        self.environment(\.fruitLabelStyle, style)
    }
}
