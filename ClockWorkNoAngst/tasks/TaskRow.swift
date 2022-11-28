
import SwiftUI
import  EventKitUI
import UIKit
import Firebase
import FirebaseFirestoreSwift
struct TaskRow: View {
    @State var check:Bool
    @State var title : String
    @State var text=[]
    
   // @Binding var buttonAction: () -> Void
    var db = Firestore.firestore()
    
    var color1:CGColor =  #colorLiteral(red: 0.3116869926, green: 0.3075950146, blue: 0.3075473309, alpha: 1)
    
    var taskrowInformation = TaskConstruction(check: (false), title: .constant(""))
    var body: some View {
        VStack{
                
                
                
                HStack(content: {
                    Text(title).foregroundColor(.primary).animatableFonts(size: 28, weight: .bold, design: .rounded)
                    
                    Image(systemName: text[check ? 0 : 1 ] as! String).animatableFonts(size: 30, weight: .heavy, design:.none).onTapGesture {
                        check.toggle()}
                    
                })
                
            }.frame(alignment: .bottomTrailing)
        
        
        
    }
   /* var getTasksButton: some View{
        Button(<#LocalizedStringKey#>, role:{buttonAction}(), action: { AddTask(item: ItemData)})
    }*/
    
            
            
        }
        

struct getTasksFirestore:View{
    @State var buttonAction: () -> Void

    var body: some View{
        Button(action: buttonAction, label: {Text("Create task")})
    }
}

struct TaskConstruction:Identifiable{
    var id = UUID()
   @State var check: Bool
    @Binding var title:String
    @State var text =  ["checkmark.circle","circle"]
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(check:false, title: "Gör mat", text: [])
    }
    
}
