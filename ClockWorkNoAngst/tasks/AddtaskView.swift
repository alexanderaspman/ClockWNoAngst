import SwiftUI
import Firebase
struct AddTaskRow: View {
    @Binding var toggleShowCreateTask:Bool
    @State private var title : String = ""
  
    var colorBtn:CGColor = #colorLiteral(red: 0.09359260344, green: 0.2222320094, blue: 0.09414240218, alpha: 0.8470588235)
    
    var colorBtnText:CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var color1:CGColor = #colorLiteral(red: 0.8847508286, green: 0.7508169569, blue: 0.6329493331, alpha: 1)
    


    var body: some View {
        VStack(alignment: .leading, spacing:20){
            Text("Create a new task").animatableFonts(size: 24, weight: .bold, design: .monospaced)
            TextField("Enter task here",text : $title).textFieldStyle(.roundedBorder)
          
            Button(action: {self.toggleShowCreateTask.toggle()}, label: {Text("Add text").animatableFonts(size: 24, weight: .regular, design: .serif).foregroundColor(Color(colorBtnText)).padding().padding(.horizontal).background(Color(colorBtn).cornerRadius(30))})
            Spacer()
        }.padding(16).background(Color(color1))
        
       
    }
    func addTask(){
        let db =  Firestore.firestore()
        db.collection("task").document("structTaskData").setData([
            "title":"\($title)",
            "checked": "circle",
        ])
    }
    
}

struct AddTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskRow(toggleShowCreateTask:.constant (false))
    }
}
