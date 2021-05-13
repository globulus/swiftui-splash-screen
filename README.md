# SwiftUISplashScreen

Add a **Splash Screen to your SwiftUI app**! You can specify a custom view that will show when your app starts and then dismiss itself automatically after a certain period of time.

The end result looks like this:

![in action](https://swiftuirecipes.com/user/pages/01.blog/swiftui-splash-screen/ezgif-2-d3d0362f280a.gif)

### Recipe

Check out [this recipe](https://swiftuirecipes.com/blog/swiftui-splash-screen) for in-depth description of the component and its code. Check out [SwiftUIRecipes.com](https://swiftuirecipes.com) for more **SwiftUI recipes**!

### Sample usage

```swift
struct HomeView: View {
  var body: some View {
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
```

### Installation

This component is distrubuted as a **Swift package**. 

