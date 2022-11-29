import SwiftUI
import SceneKit

struct NotesVerticalScroll: View {
    @State var section : Section
    @Binding var text :  String
    @Binding var title :  String

    @Binding var dexriptionText :  String
    @Binding var toggleCard:Bool
    
    var body: some View {
        
        ZStack{
            if !toggleCard {
                ScrollView(.vertical, content: {
                VStack{
                    
                    ForEach(sectionData2){item in
                        SectionViewVer(section: item, title: item.title, text: item.text, descriptionText: item.text)
                        
                        
                       

                    }
                    
                    
                    
                    
                }
                
                
                
            }
            )
            }
          
            }
        
            
        
        
                       }
    }





struct SectionViewVer: View {

    @State var section : Section
    @State var toggleOn:Bool = true
    @State var ScaleFactor : Bool = false
    @State var avatar:Bool = false
    @State var toggleCard = false
    @State var title: String

    @State var text: String
    @State var descriptionText = ""
    @State var infinitNotInfinit = ["maxWidth: .inifite",""]
        var bgColor:CGColor = #colorLiteral(red: 1, green: 0.9124215852, blue: 0.8971559357, alpha: 0.8470588235)
        var color:CGColor =  #colorLiteral(red: 1, green: 0.6776536475, blue: 0.7351800351, alpha: 0.8470588235)
        
        var fallTrap:CGColor =   #colorLiteral(red: 0.504596293, green: 0.3172480464, blue: 0.3185980916, alpha: 1)
    var body: some View{
        ZStack {
            
            
            
            VStack(alignment: .center,spacing: 10) {
                
                //  DragAblleText.foregroundColor(.black)
                ZStack{
                    VStack{
                        
                        
                    VStack(alignment: .center,content:{
                        Button(action: {
                            title = self.section.title
                            text = section.text
                            toggleOn.toggle()
                            self.toggleCard.toggle()
                        }, label: {     rectNGLEFALLDOR.offset(x: toggleOn ? 0 : 120)
                            Text(section.text).padding().frame(width: toggleOn ? -210  : 300  , height: 200,alignment: .bottom).background(.white).opacity(0.4).foregroundColor(.black).opacity(1).offset(x:toggleOn  ? -90:-160,y: 300).animation(Animation.easeIn(duration: 1).delay(2), value:toggleOn)
                        })
                        .shadow(radius: 15,x:0,y:20)
                 
                        
                        
                        
                }).padding(.horizontal, 0).padding(.top,toggleOn ? 0 : 60)
                           }
                }
                Text(section.text).padding().frame(width: toggleOn ? 10  : 300  , height: 200,alignment: .bottom).foregroundColor(.black).background(.white).offset(x:toggleOn  ? -200:200,y: 300).animation(Animation.easeIn(duration: 1).delay(2), value:toggleOn).blendMode(.overlay).opacity(0.4).background(.ultraThinMaterial).opacity(0.3)
            }}
    }
                       
                        //.frame(width: toggleOn ? 30  : 500  , height: 200,alignment: .topLeading)
                        
                        //.padding(.top,-10)
                        
                        
                        
                   
        
        
    var rectNGLEFALLDOR: some View {
        
        
        return  VStack{
            HStack(alignment:.top){
                
                
                VStack(){
                    
                    
                    
                    
                    
                    Rectangle().fill(Color(fallTrap)).frame(width: toggleOn ? 50 : 207,height: toggleOn ? 68 : 157 ,alignment: Alignment(horizontal: .center, vertical: .center)).rotation3DEffect(Angle(degrees:toggleOn ? 120: 30), axis: (x:toggleOn ? 121:51,y:toggleOn ? 2: 4,z:0)).rotationEffect(Angle(degrees:toggleOn ? 40
                                                                                                                                                                                                                                                                                                                : -90), anchor:.trailing).position( x:toggleOn ? 62 : 27,y: toggleOn ? 330:308).padding(.horizontal,100)                              .animation(Animation.spring(response: 0.5,dampingFraction: 1) ).position(x:70,y:-30
                    ).onTapGesture {
                        
                    //  ScaleFactor.toggle()
                        toggleOn.toggle()
                        descriptionText = self.section.text
                        
                        toggleCard.toggle()
                    }                                                                                                                     }        //.overlay(content:
                //Content(content:Content)  -> content={  return Text("titttlreeecdd")}
                
            
                   
                section.image?.frame(width: 200,height: 200).scaleEffect(toggleOn ? 0.3 : 0.34).position( x:toggleOn ? 102 : 95 ,y:90).blendMode(.overlay)
                
                Text(section.text.uppercased()).frame(width: 265).offset(x: -40,y:  toggleOn ? -90 : 600 ).animation(Animation.easeOut(duration: 3), value: toggleOn)
             //   Image("cube").frame(minWidth: 60, idealWidth: 150, maxWidth: 200, minHeight: 60, idealHeight: 150, maxHeight: 200, alignment: .center).aspectRatio(contentMode: .fit)
                    .frame(width:120)
                
            } .shadow(radius: 20)
            Text(section.title)
                .font(.system(size:24,weight:.bold))
                .frame(width: 160, alignment: .bottomLeading)
                .foregroundColor(Color(color)).padding(30).onTapGesture {
                    self.toggleOn.toggle()
                }.position(x:240,y:90)
            
            
            
            
            
        }.frame(width: toggleOn ?  300 : 285   ,   height: toggleOn ?  400 :  425,alignment:Alignment( horizontal: .center, vertical: .top))
            .background(section.color)
        
            .cornerRadius(30)
            .shadow(color: Color(color).opacity(0.2),radius:20,x:0,y:20)
        //    .offset(y:500)
        
    }
        }

struct Section:Identifiable{
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image:Image?
    var color:Color?
    
}

let sectionData2 =
    [
    
        
        Section( title: "NOTE1 Title", text: "description text", logo: "Loga", image: Image("cube2"), color: Color(#colorLiteral(red: 1, green: 0.9124215852, blue: 0.8971559357, alpha: 0.8470588235))),
           
           
            Section( title: "NOTE2 Title", text: "description text description text description text description text description text description text", logo: "Loga", image: Image("cube2"), color:Color(#colorLiteral(red: 1, green: 0.4159984815, blue: 0.5757726487, alpha: 0.8470588235))),
        
        
        Section( title: "NOTE2 Title", text: "description text description text description text description text description text description text", logo: "Loga", image: Image("cube2"), color:Color(#colorLiteral(red: 1, green: 0.9124215852, blue: 0.8971559357, alpha: 0.8470588235))),
        
        
        Section( title: "NOTE2 Title", text: "description text description text description text description text description text description text", logo: "Loga", image: Image("cube2"), color:Color(#colorLiteral(red: 1, green: 0.4159984815, blue: 0.5757726487, alpha: 0.8470588235))),
        
        
        Section( title: "NOTE2 Title", text: "description text description text description text description text description text description text", logo: "Loga", image: Image("cube2"), color:Color(#colorLiteral(red: 1, green: 0.9124215852, blue: 0.8971559357, alpha: 0.8470588235))),
        
        
        Section( title: "NOTE2 Title", text: "description text description text description text description text description text description text", logo: "Loga", image: Image("cube2"), color:Color(#colorLiteral(red: 1, green: 0.4159984815, blue: 0.5757726487, alpha: 0.8470588235)))

            
        
    ]

    

struct NotesVerticalScroll_Previews: PreviewProvider {
    static var previews: some View {
        NotesVerticalScroll( section: Section(title: "", text: "", logo: ""), text: .constant("") , title: .constant(""),dexriptionText: .constant(""), toggleCard: .constant(false))
    }
}
