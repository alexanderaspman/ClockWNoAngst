//
//  TimeLeftVisual.swift
//  ADHDClockNotificationApp
//
//  Created by alexander aspman on 2022-10-28.
//

import SwiftUI



struct TimeLeftVisual: View {
  //  @Binding var timerStart : Bool
    
    var color1 = #colorLiteral(red: 0.9612575173, green: 0.2538030238, blue: 0.236307254, alpha: 1)
    var color2 = #colorLiteral(red: 0.9612575173, green: 0.0508318432, blue: 0.1304445198, alpha: 1)
    var color3 = #colorLiteral(red: 0.527324638, green: 0.02788522621, blue: 0.0715589818, alpha: 1)
    var color5 = [#colorLiteral(red: 0.09236055057, green: 0.2719038442, blue: 0.527324638, alpha: 1), #colorLiteral(red: 0.1148044535, green: 0.3379773296, blue: 0.655466176, alpha: 1)]
    var width : CGFloat = 200
    var height : CGFloat = 230
  @State  var percent:CGFloat = 100
  // var decimalProcent: Double

    @Binding var startShow : Bool
    @Binding var startTimer : Bool 

    func StyrtMyTimer(percent:CGFloat) {
      self.percent = 0

    }
    
    
  /*  func StartTimer(startTimer:Bool){
        self.startTimer=true
        for i in StartTimerSequens{
            
        }
        
    }*/
    var body: some View {
   
    
    
    return  ZStack{
        rectangleTimer.onTapGesture{
            withAnimation(.linear(duration: 60))
            {  StyrtMyTimer(percent: 0)}
        self.startShow.toggle()}
        circleTimer
    }

            
           
    }
    
    
    

    
    var rectangleTimer: some View {
       
        let _ = width/44
        let progress = 1 - ( percent/100)
        
        return Rectangle().trim(from: startShow ? progress : 1, to: 1)            .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]),
                                                                                         startPoint: .trailing, endPoint: .leading),
                                                                                                                                                 style: StrokeStyle(lineWidth: width,
                                                                                                                                                                    lineCap:.square,lineJoin:
                                                                                                                                                        .miter , miterLimit: .infinity, dash: [200,10],dashPhase: 3 )
        ).rotationEffect(Angle(degrees: 0))
            .rotation3DEffect(Angle(degrees: 0), axis: (x:4,y:2,z:0))
            .frame(width: width,height: height * 3.38)
            .shadow(color:Color(.blue).opacity(0.234),radius: 25,x: 0,y: 3)
        
        
        
    }
    var circleTimer: some View{
        
        let remainingMinutes = (3600 * percent / 60 * 0.01)
        let multiplier = width/80
        let progress = 1 - ( percent/100)
        return ZStack(){
            
        VStack{
            
            Circle().trim(from: progress, to: 1).stroke(Color(color3),style: StrokeStyle(lineWidth: 5*multiplier, lineCap: .round,lineJoin: .round, miterLimit: .infinity,dash: [0,20],dashPhase: 0)).rotationEffect(Angle(degrees: 274)).rotation3DEffect(Angle(degrees: 0), axis: (x:4,y:2,z:0))            .frame(height: height).position(x:200,y: 600).shadow(color:Color(color5[1]).opacity(0.98934),radius: 24)
            }
         
                
            Text("\(Int(remainingMinutes)) minutes left").padding(8) .background(Color(.secondaryLabel)).cornerRadius(10).foregroundColor(.white).bold().font(.system(size:29,design:.rounded)).frame(width:  170,height:200 ).position(x:200,y: 600).onTapGesture{
                withAnimation(.linear(duration: 600))
                {  StyrtMyTimer(percent: 0)}
            self.startShow.toggle()}}
    }
    
}
    



/*class StartTimerSequens(Sequence:struct TimeLeftVisual{percent:
$percent    }) {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addEllipse(in: rect)
        }
    }
}
   
    
var minutes : Date.minute  = 60
    
  Published  var secundes : Date{
        didSet{
            self.second(T##Foundation.Date.FormatStyle.Symbol.Second) = +(time: startTimer, seconds: 3600)
        }
    }
    
    var setTime  : Int = 3600
    var rectangleTime = 3600
    var timeLeft : Int = 0
    var timerIsActive : Bool
    
    
}
}

    */
    

struct TimeLeftVisual_Previews: PreviewProvider {
    static var previews: some View {
        TimeLeftVisual(
            startShow: .constant(true),startTimer: .constant(false))
//            data: .constant("MegaManKeyNote"),
                    
    }}

