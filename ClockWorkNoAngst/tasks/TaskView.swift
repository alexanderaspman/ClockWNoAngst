//
//  TaskView.swift
//  ADHDClockNotificationApp
//
//  Created by alexander aspman on 2022-11-11.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import RealmSwift
struct HomeTaskView: View {
    @EnvironmentObject var  realmManager : RealmManager
    var db = Firestore.firestore()
    var color1:CGColor = #colorLiteral(red: 0.8588566635, green: 0.7204809247, blue: 0.5257162035, alpha: 1)
    var colorBtnText:CGColor = #colorLiteral(red: 0.3092807101, green: 0.4645345159, blue: 0.8001657351, alpha: 0.8470588235)
    var colorBtn:CGColor = #colorLiteral(red: 0.1142898477, green: 0.3489108615, blue: 0.08800940392, alpha: 0.8470588235)
   @State var toggleShowCreateTask = true
    @State var title : String
    @State var check = false
    var body: some View {
        VStack{
            
            if  toggleShowCreateTask {
                Text("My tasks")  .padding().frame(maxWidth: .infinity,alignment: .topLeading).animatableFonts(size: 28, weight: .bold, design: .default)
                Spacer()
                List{
                    ZStack{
                   Color(color1)
                    ForEach(realmManager.tasks, id: \.id){
                        task in
                        
                        TaskRow(   completed: task.completed, title: task.title).onTapGesture {realmManager.uppdateTask(id: task.id, completed: !task.completed)}
                 }   }.onAppear{UITableView.appearance().backgroundColor = UIColor.clear
                        
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                        
                    }
                }.background(Color(color1))
                
                
                Spacer()
                HStack(alignment: .bottom, content: {
                    
                    Button(action: {NavigationLink(+, destination: AddTaskRow(toggleShowCreateTask: $toggleShowCreateTask).environmentObject(realmManager))
                    },  label: {Text("+").padding(.bottom,20).animatableFonts(size: 39, weight: .bold, design: .rounded).frame(maxWidth: .infinity).background(Color(colorBtn)).foregroundColor(.white).frame(width: 55,height: 55,alignment: .top).cornerRadius(45)})
                }).frame(maxWidth:.infinity,alignment: Alignment(horizontal: .trailing, vertical: .bottom)).padding() }
                
            
            else{
                AddTaskRow(toggleShowCreateTask: $toggleShowCreateTask).environmentObject(realmManager)

            }
            
            
            
            
        }.frame(maxWidth: 550,maxHeight: .infinity).padding(.horizontal,30).background(Color(color1))
 
    
    
    }
    
            
            
        }
        
 
struct HomeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTaskView(  title: "").environmentObject(RealmManager())
    }
}
