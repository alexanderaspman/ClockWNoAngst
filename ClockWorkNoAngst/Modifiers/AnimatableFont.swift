import SwiftUI

struct AnimatebleFontsModifier: ViewModifier{
    var size : Double
    var weight : Font.Weight = .regular
    var design : Font.Design? = .default
    
    var AnimateData:Double{
        get {size}
        set {size = newValue}
    }
    func body (content:Content)-> some View {
    content
            .font(.system(size:size, weight:weight, design:design ))
    }
}
extension View{
    func animatableFonts(size : Double,weight : Font.Weight,design : Font.Design?)-> some View{
        self.modifier(AnimatebleFontsModifier(size: size, weight:weight, design:design ))
        
    }
}
