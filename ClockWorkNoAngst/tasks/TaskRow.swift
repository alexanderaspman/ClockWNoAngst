
import SwiftUI
import  EventKitUI
import UIKit
import RealmSwift
import Firebase
import FirebaseFirestoreSwift
struct TaskRow: View {
    
   @State var completed:Bool = false
   @State  var title : String = ""
     var text:[String]?

   // @Binding var buttonAction: () -> Void
    @EnvironmentObject var realmManager : RealmManager
    
    var color1:CGColor =  #colorLiteral(red: 0.3116869926, green: 0.3075950146, blue: 0.3075473309, alpha: 1)
    
 // var taskrowInformation = TaskConstruction( completed: false, title: .constant(title), text: [String]?)

    
    
    var body: some View {
        VStack{
                
                
                
                HStack(content: {
                    Text(title).foregroundColor(.primary).animatableFonts(size: 28, weight: .bold, design: .rounded)
                    
                    Image(systemName: completed ?  "checkmark.circle" : "circle") .animatableFonts(size: 30, weight: .heavy, design:.none)
                    
                    
                })
                
            }.frame(alignment: .bottomTrailing)
        
        
        
    }
   /* var getTasksButton: some View{
        Button(<#LocalizedStringKey#>, role:{buttonAction}(), action: { AddTask(item: ItemData)})
    }*/
    
            
            
        }
        


struct TaskConstruction:Identifiable{
    var id = UUID()
   @State var completed: Bool
    @State var title:String
    @State var text =  ["checkmark.circle","circle"]
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(completed:false, title: "Gör mat", text: []).environmentObject(RealmManager())
    }
    
}
