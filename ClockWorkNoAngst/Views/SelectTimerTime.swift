//
//  SwiftUIView.swift
//  buildingThings
//
//  Created by alexander aspman on 2022-11-20.
//

import SwiftUI

struct SwiftUIView: View {
    @State var showOn = false
    @State var focusOnCircle :Bool
   // var navigationStruct : NavigationStructText
    //@State var navigationText = "Time picker"
    var bgColor:CGColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    
    var body: some View {
        VStack(content: {
            
            ZStack{
                Color(bgColor)
                
                VStack{
                //    NavigationStructText(, navigationText:navigationStruct.navigationText)

                    HStack{
                        ForEach(sectionData){item in
                            CircleShape(  focusOnCircle: $focusOnCircle, diffCircle: item,text:item.text).padding(.horizontal,2).onTapGesture {
                                if focusOnCircle {
                                }
                                
                            }
                            
                        }                }.frame(width: 440).padding(.bottom,60)
                    
                    Text("Start timer").frame(width: 150,height: 50,alignment:Alignment(horizontal: .center, vertical: .center)).background(.black).blendMode(.hardLight).foregroundColor(.white).cornerRadius(50).scaleEffect(showOn ? 3 : 1).transition(.slide )
                }.onTapGesture {
                    withAnimation(.spring(response: 0.4,dampingFraction: 0.6).speed(2)){
                        showOn.toggle()}
                }
                if showOn{
                    TimeLeftVisual( startShow: .constant(true), startTimer: .constant(false)).ignoresSafeArea().transition(.move(edge: .top)).transition(.scale(scale: 0.1,anchor: .bottomTrailing) )
                        .zIndex(1)
                    
                }  }.edgesIgnoringSafeArea(.vertical)})
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView( focusOnCircle: true)
    }
}
struct CircleShape:View{
    @Binding var focusOnCircle :Bool
    @State var circleFocus = true
    var diffCircle : DiffCircle
    var colorOutlines:UIColor=(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))

    var text : String
    var body: some View{
        ZStack{
           
            Circle().fill(circleFocus ? diffCircle.color1 : diffCircle.color2 ).frame(width: 85).shadow(radius: 20 ).scaleEffect(circleFocus ? 1 : 1.1).tint(!circleFocus ? .none : diffCircle.color2).overlay {
                Text(diffCircle.text).bold().font(.system(size:12))
            }.padding(.leading, circleFocus ? -2:5).tint((diffCircle.color1)).blur(radius: circleFocus ? 2 : 9).offset(x:circleFocus ? 2 : -1,y: circleFocus ? 1:-2).shadow( color: Color(.black).opacity(0.5),radius: circleFocus ? 0 : 3
                                                                                                                                                                             ,x: 3,y:4).onTapGesture {
                withAnimation(.spring(response: 0.4,dampingFraction: 1.4)){
                    self.circleFocus.toggle()
                    self.focusOnCircle.toggle()
                }
            }
            Circle() .stroke(LinearGradient(gradient: Gradient(colors: [(diffCircle.color1), Color(colorOutlines)]),
                                            startPoint: .trailing, endPoint: .leading),
                             style: StrokeStyle(lineWidth: 1.5,
                                                lineCap:.square,lineJoin:
                                    .miter , miterLimit: .infinity, dash: [200,0],dashPhase: 0 )
            ).frame(width: 80).shadow(radius: 10 ).shadow( color: Color(.black).opacity(0.8),radius: 5
                                                           ,x: 3,y:4).scaleEffect(circleFocus ? 1 : 1.15).tint(!circleFocus ? .none : diffCircle.color2).overlay {
                Text(diffCircle.text).bold().font(.system(size:22))
            }.padding(.horizontal,2).onTapGesture {
                withAnimation(.spring(response: 0.8,dampingFraction: 0.6)){
                    self.circleFocus.toggle()
                    focusOnCircle.toggle()
                }
            }
            if !circleFocus{   Circle().fill(circleFocus ? diffCircle.color1 : diffCircle.color2 ).frame(width: 85).shadow(radius: 10 ).scaleEffect(circleFocus ? 1 : 1.2).tint(!circleFocus ? .none : diffCircle.color2).overlay {
                Text(diffCircle.text).bold().font(.system(size:12))
            }.padding(.leading, circleFocus ? -2:5).tint((diffCircle.color1)).blur(radius: circleFocus ? 2 : 9).offset(x:circleFocus ? 2 : -3,y: circleFocus ? 1:-4).shadow( color: Color(.black).opacity(0.5),radius: circleFocus ? 0 : 3
                                                                                                                                                                             ,x: 3,y:4).opacity(0.5).overlay {
                Text(diffCircle.text).bold().font(.system(size:22))
            }.padding(.horizontal,2)}
        }
        
    }
}




struct DiffCircle:Identifiable{
    var id = UUID()
    var text : String
    var color1 : Color
    var color2 : Color
    var startTimerThis: Int
    var circleFocus:Bool
    /*required  init(colorOutlines:any BinaryInteger,text:String,color1:Color,color2:Color,startTimerThis:Int,circleFocus:Bool){
            self.colorOutlines=colorOutlines
        self.text=text
        self.color1=color1
        self.color2=color2
        self.startTimerThis=startTimerThis
        self.circleFocus=circleFocus

        }*/
    
    
    
}

let sectionData =
    [
    
        
        DiffCircle( text: "15 min", color1: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),color2: Color( #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), startTimerThis: 15, circleFocus: true),
           
           
        DiffCircle(  text: "30 min", color1: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),color2: Color( #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), startTimerThis: 15, circleFocus: true ),
        
        
        DiffCircle( text: "45 min", color1: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),color2: Color( #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), startTimerThis: 15, circleFocus: true),
        
        
        DiffCircle(  text: "60 min", color1: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), color2: Color( #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)),startTimerThis: 15, circleFocus: true)
        
        
            
        
    ]


