//
//  TaskView.swift
//  ADHDClockNotificationApp
//
//  Created by alexander aspman on 2022-11-11.
//

import SwiftUI

struct HomeTaskView: View {
    var color1:CGColor = #colorLiteral(red: 0.8588566635, green: 0.7204809247, blue: 0.5257162035, alpha: 1)
    var colorBtn:CGColor = #colorLiteral(red: 0.3092807101, green: 0.4645345159, blue: 0.8001657351, alpha: 0.8470588235)
   @State var toggleShowCreateTask = true
    @Binding var title : String

    var body: some View {
        VStack{
            
          if  toggleShowCreateTask {
            Text("My tasks")  .padding().frame(maxWidth: .infinity,alignment: .topLeading).animatableFonts(size: 28, weight: .bold, design: .default)
            Spacer()
          
            TaskRow(title: "Go to Store", text: "")
            
            Spacer()
            HStack(alignment: .bottom, content: {
                
                Button(action: {
                    self.toggleShowCreateTask = false
                    
                }, label: {Text("+").padding(.bottom,20).animatableFonts(size: 39, weight: .bold, design: .rounded).frame(maxWidth: .infinity).background(Color(colorBtn)).foregroundColor(.white).frame(width: 55,height: 55,alignment: .top).cornerRadius(45)})
            }
                
            ).frame(maxWidth:.infinity,alignment: Alignment(horizontal: .trailing, vertical: .bottom)).padding() }
            else{
                AddTaskRow(toggleShowCreateTask: .constant(true))
          //      AddTaskRow(toggleShowCreateTask: ($toggleShowCreateTask))

            }
            
            
            
            
                             }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color(color1))
          
 
    
    
    }

}
struct HomeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTaskView( title: .constant(""))
    }
}
