import SwiftUI

struct FruitLabel: View {
    let name: String
    var style: any FruitLabelStyle
    
    init(name: String, style: some FruitLabelStyle = DefaultFruitLabelStyle()) {
        self.name = name
        self.style = style
    }
    
    var body: some View {
        AnyView {
            style.makeBody(configuration: FruitLabelConfiguration(title: name))
        }
    }
}
