import SwiftUI

struct FruitLabel: View {
    let name: String
    @Environment(\.fruitLabelStyle) private var style: any FruitLabelStyle
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        AnyView {
            style.makeBody(configuration: FruitLabelConfiguration(title: name))
        }
    }
}
