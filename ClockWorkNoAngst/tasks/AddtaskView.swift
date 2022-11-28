import SwiftUI
import Firebase
struct AddTaskRow: View {
    @EnvironmentObject var firestoreManager : FirestoreManager
    @Binding var toggleShowCreateTask:Bool
    @State  var title : String = ""
    var db = Firestore.firestore()
   @State var items = [ItemData]()
    var colorBtn:CGColor = #colorLiteral(red: 0.09359260344, green: 0.2222320094, blue: 0.09414240218, alpha: 0.8470588235)
    
    var colorBtnText:CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var color1:CGColor = #colorLiteral(red: 0.8847508286, green: 0.7508169569, blue: 0.6329493331, alpha: 1)
    
    
    var body: some View {
        VStack(alignment: .leading, spacing:20){
            Text("Create a new task").animatableFonts(size: 24, weight: .bold, design: .monospaced)
            TextField("Enter task here",text : $title).textFieldStyle(.roundedBorder)
            
            Button(action: {
                AddTask(item: ItemData(title: title, check: false,checked: "circle"))
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4,dampingFraction: 0.6).speed(2)){
                            ForEach(items) { item in
                                HomeTaskView(item.title)
                            }
                            toggleShowCreateTask.toggle()}
                    }
                
                    self.toggleShowCreateTask.toggle()
            }, label: {Text("Add text")}).animatableFonts(size: 24, weight: .regular, design: .serif).foregroundColor(Color(colorBtnText)).padding().padding(.horizontal).background(Color(colorBtn).cornerRadius(30))}
            
       
       
            
        
.onAppear{
    listenToStore()}
        
    }
    
    
    func AddTask(item:ItemData){
        do {
          let result = try db.collection("userTask").addDocument(from: item)
        }catch{
            print("error saving data")
        }
        
        
        
        
        
    }
    
    func listenToStore(){
        db.collection("userTask").addSnapshotListener{snapshot,error in
            guard let snapshot = snapshot else {
                return
            }
            if let error = error{
                print("error \(error)")
                return
            }
            items.removeAll()
            
            for document in snapshot.documents{
                let result = Result {
                    try document.data(as: ItemData.self)
                }
                switch result {
                case .success(let item): items.append(item)
                case .failure(let error):
                    print("error")
                    break
                }
            }
            
            
        }
        
    }
   
}

struct AddTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskRow(toggleShowCreateTask:.constant (false))
    }
}
