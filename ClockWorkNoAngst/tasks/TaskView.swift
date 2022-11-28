//
//  TaskView.swift
//  ADHDClockNotificationApp
//
//  Created by alexander aspman on 2022-11-11.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
struct HomeTaskView: View {
    @State var items = [ItemData].self
    var db = Firestore.firestore()
    var color1:CGColor = #colorLiteral(red: 0.8588566635, green: 0.7204809247, blue: 0.5257162035, alpha: 1)
    var colorBtn:CGColor = #colorLiteral(red: 0.3092807101, green: 0.4645345159, blue: 0.8001657351, alpha: 0.8470588235)
   @State var toggleShowCreateTask = true
    @State var title : String
    @State var check = false
    var body: some View {
        VStack{
            
          if  toggleShowCreateTask {
            Text("My tasks")  .padding().frame(maxWidth: .infinity,alignment: .topLeading).animatableFonts(size: 28, weight: .bold, design: .default)
            Spacer()
                 TaskRow( check: check,  title: title, text: [""])
              
              
            
            Spacer()
            HStack(alignment: .bottom, content: {
                
                Button(action: {toggleShowCreateTask.toggle()},  label: {Text("+").padding(.bottom,20).animatableFonts(size: 39, weight: .bold, design: .rounded).frame(maxWidth: .infinity).background(Color(colorBtn)).foregroundColor(.white).frame(width: 55,height: 55,alignment: .top).cornerRadius(45)})
            }
                
            ).frame(maxWidth:.infinity,alignment: Alignment(horizontal: .trailing, vertical: .bottom)).padding().onAppear{
                listenToStore()
            } }
            else{
                AddTaskRow(toggleShowCreateTask: ($toggleShowCreateTask))
          //      AddTaskRow(toggleShowCreateTask: ($toggleShowCreateTask))

            }
            
            
            
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(color1))
 
    
    
    }
    class addTask:ObservableObject{
        @Published var title: String=""
        func AddTask(item:ItemData){
            do {
                let result = try db.collection("userTask").getDocument(from: item)
                
                result.getDocument{(document,error) in
                    guard error == nil else {
                        print("print error" , error ?? "")
                        return
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
                catch{
                print("error saving data")
            }
            
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
struct HomeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTaskView(  items: [ItemData](), title: "")
    }
}
