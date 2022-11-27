
import SwiftUI
import  EventKitUI
import UIKit
struct TaskRow: View {
    
    @State var check:Bool = false
    @State var title : String
    @State var text : String
    var color1:CGColor =  #colorLiteral(red: 0.3116869926, green: 0.3075950146, blue: 0.3075473309, alpha: 1)

    var taskrowInformation = TaskConstruction(title: .constant(""), text: "")
    var body: some View {
        
        VStack{
           
            
            HStack(content: {
                Text(title).foregroundColor(.primary).animatableFonts(size: 28, weight: .bold, design: .rounded)
                
                Image(systemName: check ? "checkmark.circle":"circle").animatableFonts(size: 30, weight: .heavy, design:.none).onTapGesture {
                check.toggle()}
            
                                                                    })
        
        }.frame(alignment: .bottomTrailing)
        
    }
        
           }



struct TaskConstruction:Identifiable{
    var id = UUID()
    @Binding var title:String
    var text:String
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(title: "Gör mat", text: "")
    }
    
}
