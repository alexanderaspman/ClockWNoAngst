//
//  TabBar.swift
//  ADHDClockNotificationApp
//
//  Created by alexander aspman on 2022-11-15.
//

import SwiftUI
import Foundation

struct TabBar: View
{
    @EnvironmentObject var  realmManager : RealmManager
    @State var startShow:Bool
    var switchCard:Bool
    var title:String
    var body: some View {
        
        TabView{
            
            HomeTaskView( title: "").environmentObject( realmManager).tabItem({
                Image(systemName: "house")
                Text("Home").foregroundColor(.white).background(.secondary).blendMode(.darken)
                
            })
            NotesVerticalScroll(text: .constant(""), title: .constant(""), dexriptionText: .constant(""), toggleCard: .constant(false)).tabItem({
                Image(systemName: "timer.circle.fill").font(.system(size: 29, weight: .bold, design: .rounded)).foregroundColor(.white)
                Text("Timer").foregroundColor(.white).background(.secondary).blendMode(.darken)

            })
            SwiftUIView(  focusOnCircle: true  ).tabItem({
                Image(systemName: "timer.circle.fill").font(.system(size: 29, weight: .bold, design: .rounded)).foregroundColor(.white)
                Text("Timer").foregroundColor(.white).background(.secondary).blendMode(.darken)

            })
            
              
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(startShow: (false), switchCard: false, title: "")
    }
}
