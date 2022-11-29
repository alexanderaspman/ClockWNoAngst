
import SwiftUI
import Foundation

struct TabBar: View
{
    @State var startShow:Bool
    var switchCard:Bool
    var title:String
    var body: some View {
       ZStack{
        TabView{
            
            AddTaskRow(toggleShowCreateTask: .constant(false)).tabItem({
                Image(systemName: "house")
                Text("Home").foregroundColor(.white).background(.secondary).blendMode(.colorBurn)
                
            })
            HomeTaskView ( title:"").tabItem({
                Image(systemName: "list.bullet.clipboard.fill").font(.system(size: 29, weight: .bold, design: .rounded)).foregroundColor(.white)
                Text("Timer").foregroundColor(.white).background(.secondary).blendMode(.darken)

            })
            CalibrateTimer(  focusOnCircle: true  ).tabItem({
                Image(systemName: "timer.circle.fill").font(.system(size: 29, weight: .bold, design: .rounded)).foregroundColor(.white)
                Text("Timer").foregroundColor(.white).background(.secondary).blendMode(.darken)

            })
            
           
        }
           
       }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(startShow: (false), switchCard: false, title: "")
    }
}
