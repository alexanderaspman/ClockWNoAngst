import SwiftUI

struct ContentView3: View{
    @State var title: String
    @State var description : String
     @State var toggleOn=false
    var color1 = #colorLiteral(red: 0.4566026926, green: 0.2162504494, blue: 0.2162116766, alpha: 1)
    var color2 = #colorLiteral(red: 0.5044957399, green: 0.3130049706, blue: 0.3142708242, alpha: 1)
    var color3 = #colorLiteral(red: 0.6872907281, green: 0.4612035751, blue: 0.4617624283, alpha: 1)
    var bgColor = #colorLiteral(red: 0.4540982246, green: 0.2826255262, blue: 0.2843172252, alpha: 1)
    var body:some View{
        VStack(spacing: 0){
            HStack{
                Button(action:
                        {
                    
                }, label: {
                    Rectangle()
                    .frame(width: 345,height: 40,alignment: .leading)})
                
                Button(action: {}, label: { Image(systemName:"line.horizontal.3")})
                
            }
            
            .padding().overlay(
                Text("ClockworkNoAngst").font(.title2).fontWeight(.bold))
            
            
            HStack{
                ZStack{
                    Rectangle().fill(Color(color3)).frame(width: 201, height: 190).position(x:150,y:296)
                    
                    
                    Button(action:
                            {print("timer test")
                       print("")
                    }, label: {
                        Rectangle().fill(Color(color1)).frame(width: 180,height: 180,alignment: Alignment(horizontal: .trailing, vertical: .center)).position(x:234,y:227)
                        
                      // Text("Timer").foregroundColor(.black).font(.largeTitle).rotationEffect(Angle(degrees: 70)).position(x:70,y:190)
                        
                    })
                    
                    Button(action:
                            {
                        print("notes test Btn")
                       
                    }, label: {
                        Rectangle().fill(Color(color2)).frame(width: 147,height: 218,alignment: Alignment(horizontal: .center, vertical: .center)).rotationEffect(Angle(degrees: -30)).position(x:189,y:258)})
                 //   Text("Notes").position(x:220,y:190).bold().font(.largeTitle).rotationEffect(Angle(degrees: -30)).rotation3DEffect(Angle(degrees: 0), axis: (x:5,y:4,z:1))
                   
                    
                    
                }
                
            }.shadow(color:Color(.tintColor).opacity(0.072),radius: 0, x:5,y:-5)
            
    Spacer()
            
            
        Text("Ui View")
        }.background(Color(bgColor)).ignoresSafeArea().padding(1)
    }
}

    


struct BottomDragView:View{
    
    
    var content = CustomRectangle2()
    @State var toggleOn:Bool = false
    @State var setState=CGSize.zero
    @State var isDragging = false
    @State var viewState = CGSize.zero
    var body: some View{
        VStack{
            HStack(spacing: 40){
                
               Rectangle().fill(Color(.red)).frame(width: toggleOn ? 100 : 117,height: 218,alignment: Alignment(horizontal: .center, vertical: .center)).rotation3DEffect(Angle(degrees:toggleOn ? 80: 70), axis: (x:toggleOn ? 1:1,y:toggleOn ? 4: 2,z:0)).rotationEffect(Angle(degrees:toggleOn ? 196 : 95), anchor:.bottom).position( x:toggleOn ? 123 : 109,y: toggleOn ? 220:208)                                  .animation(.easeOut(duration: 1), value:toggleOn) .offset(x: viewState.width, y: viewState.height)
                    .gesture(
                        DragGesture().onChanged { value in
                            viewState = value.translation
                        }
                        
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    viewState = .zero}
                                
                            })
                
                
              //  RectangleAnimation(toggleOn: $toggleOn,GlyphIndexOffset:$GlyphIndexOffset, HorizontalAdvance, XOffsetToHOrigin, VerticalAdvance, projectValue )
              
               //         including: Text("Start animation")
                    
              //      .onTapGesture(perform: {
              //)   self.toggleOn.toggle()  })
                        
            }
        }.frame(width: .infinity, alignment: Alignment(horizontal: .leading, vertical: .bottom))
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

struct CustomRectangle2: ViewModifier {


   var overlayText = "example"

    func body(content: Content) -> some View {        return content
           .overlay(Text(overlayText).foregroundColor(.white))
           .frame(width: 435, height: 475)            .foregroundColor(Color.init(red: 222, green: 222, blue: 13)).luminanceToAlpha()    }}

struct CustomRectangle: ViewModifier {
//
//
               var overlayText = "example"
//
//
               func body(content: Content) -> some View {
//
                   return content
//
                       .overlay(Text(overlayText).foregroundColor(.white))
//
                       .frame(width: 375, height: 475)
                       .foregroundColor(Color.red)
//
                   
               }
                   
                   
                   
//
               
           }


