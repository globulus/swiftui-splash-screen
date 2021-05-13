import SwiftUI

public let swiftUISplashScreenDefaultTimeout: TimeInterval = 2.5

public struct SplashView<SplashContent: View>: ViewModifier {
    private let timeout: TimeInterval
    private let splashContent: () -> SplashContent
    
    @State private var isActive = true
    
    public init(timeout: TimeInterval = swiftUISplashScreenDefaultTimeout,
         @ViewBuilder splashContent: @escaping () -> SplashContent) {
        self.timeout = timeout
        self.splashContent = splashContent
    }
    
    public func body(content: Content) -> some View {
        if isActive {
            splashContent()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
                        withAnimation {
                            self.isActive = false
                        }
                    }
                }
        } else {
            content
        }
    }
}

public extension View {
    func splashView<SplashContent: View>(
        timeout: TimeInterval = swiftUISplashScreenDefaultTimeout,
        @ViewBuilder splashContent: @escaping () -> SplashContent
    ) -> some View {
        self.modifier(SplashView(timeout: timeout, splashContent: splashContent))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        List(1..<6) { index in
          Text("Item \(index)")
        }.splashView {
            ZStack {
                Color.blue
                Text("SwiftUIRecipes is awesome!")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
        }
    }
}
