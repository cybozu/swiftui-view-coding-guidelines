import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Custom", action: { print("hello") })
            .buttonStyle(CustomButtonStyle())
    }
}
