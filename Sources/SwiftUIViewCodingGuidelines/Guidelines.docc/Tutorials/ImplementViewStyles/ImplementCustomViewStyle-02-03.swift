import SwiftUI

extension FruitLabel {
    func fruitLabelStyle(_ style: some FruitLabelStyle) -> some View {
        FruitLabel(name: self.name, style: style)
    }
}
