import SwiftUI
import Firebase
import RealmSwift
struct AddTaskRow: View {
    @EnvironmentObject var realmManager : RealmManager
    @Binding var toggleShowCreateTask:Bool
    @State private var title : String = ""
//var db = Firestore.firestore()
   @State var items = [ItemData]()
    var colorBtn:CGColor = #colorLiteral(red: 0.09359260344, green: 0.2222320094, blue: 0.09414240218, alpha: 0.8470588235)
    
    var colorBtnText:CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var color1:CGColor = #colorLiteral(red: 0.8847508286, green: 0.7508169569, blue: 0.6329493331, alpha: 1)
    
    
    var body: some View {
        
        
        ZStack{
            Color(color1).ignoresSafeArea(.all)
        VStack(alignment: .leading, spacing:20){
            
            
         
            
            Text("Create a new task").animatableFonts(size: 24, weight: .bold, design: .monospaced)
            TextField("Enter task here",text : $title).textFieldStyle(.roundedBorder)
            
            Button(action: {
                if title != ""{
                    realmManager.addTask(taskTitle: title)           }},label:{Text("create task").background(Color(colorBtn).foregroundColor(Color(colorBtnText)).frame(width: 170,height: 50,alignment: .bottomTrailing).cornerRadius(20))})
            .onTapGesture {
                withAnimation(.spring(response: 0.4,dampingFraction: 0.6).speed(2)){
                    self.toggleShowCreateTask=true
                    
                }
                }
                
                
                
                
                
                
            }
                
                
                
                
                
        }.background(ignoresSafeAreaEdges: .all).background(Color(.systemYellow))
    }
    
    
   
}

struct AddTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskRow(toggleShowCreateTask:.constant (false)).environmentObject(RealmManager())
    }
}
