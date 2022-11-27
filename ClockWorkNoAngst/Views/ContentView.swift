//
//  ContentView.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//

import SwiftUI
import FirebaseAuth
import CoreData

struct ContentView: View {
    @EnvironmentObject var firestoreManager: FirestoreManager

    @State var email: String
    @State var createEmail: String
    @State var password : String
    @State var createPassword : String

    @Binding var showLogin : Bool
    
    @State var text :String
    @State var startAnimation:Bool = false
    @State var showCreateAccount: Bool
    @State var color1:CGColor =  #colorLiteral(red: 0.3116869926, green: 0.3075950146, blue: 0.3075473309, alpha: 1)
    @State var color2: CGColor = #colorLiteral(red: 0.4970365763, green: 0.539063096, blue: 0.6121460795, alpha: 1)
    var color3:CGColor  =  #colorLiteral(red: 0.0384599492, green: 0.113729246, blue: 0.9251486659, alpha: 1)
    var color4:CGColor  =  #colorLiteral(red: 0.6558380723, green: 0.1291509569, blue: 0.9665998816, alpha: 1)
    var color5:CGColor  =  #colorLiteral(red: 0.5354027748, green: 0.09189266711, blue: 0.5903307796, alpha: 1)
    var color6:CGColor  =  #colorLiteral(red: 0.2259767652, green: 0.9693182111, blue: 0.54085958, alpha: 1)
    
    
    
    @State  var isSuccessfull = false
    var body: some View{
        VStack{
            
            VStack{
                
                HStack{
                    //  Image(systemName: "lock.fill").foregroundColor(Color(color6)).frame(width:49,height:49).font(.system(size:18))
                    //   .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous)).shadow(color: Color(#colorLiteral(red: 0.0384599492, green: 0.113729246, blue: 0.9251486659, alpha: 1)).opacity(0.3), radius: 5, x: 0,y: 5)
                    TextField("Your email".uppercased(), text: $email).keyboardType(.emailAddress).font( .subheadline).background(Color("Color 1") ).padding(.leading).frame(height: 44)
                }
            }.frame(height: 135).frame(maxWidth: .infinity).clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous)).shadow(color: Color.black.opacity(0.15), radius: 20).offset(y:460).shadow(color: Color.black.opacity(0.2), radius: 20,x: 0,y:20)
            
            
            if !isSuccessfull {
                //  ShowlLoginView
                Text("My task is\(firestoreManager.myTask)")
              
                
            }
            else {
                //SwiftUIView(focusOnCircle: false)
              
            }
            
        }
    }
    func login(){
        Auth.auth().signIn(withEmail:email,password:password){
            (result,error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
            else{
                isSuccessfull=true;                print("success")
            }
        }
    }
    var createAccount : some View{
        VStack{
            
            HStack{
                Image(systemName: "person.crop.circle.fill").foregroundColor(Color(#colorLiteral(red: 0.6729827523, green: 0.9283120632, blue: 0.716257751, alpha: 1)
                                                                                  )).frame(width:44,height:44).font(.system(size: 24,weight: .bold ))
                    .background(Color(color4)).clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous)).shadow(color: Color(color3), radius: 5, x: 0,y: 5)
                TextField("Your email".uppercased(), text: $createEmail).keyboardType(.emailAddress).frame(width:270,height:32,alignment: .leading).background(.white).cornerRadius(5).frame(height: 60)
                
            }
            HStack{
                Image(systemName: "lock.fill").foregroundColor(Color(#colorLiteral(red: 0.6729827523, green: 0.9283120632, blue: 0.716257751, alpha: 1)
                                                                    )).frame(width:44,height:44).font(.system(size: 24,weight: .bold ))                           .background(Color(color4)).clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous)).shadow(color: Color(color3), radius: 5, x: 0,y: 5)
                SecureField("Your password".uppercased(), text: $createPassword).keyboardType(.emailAddress).frame(width:270,height:42,alignment: .leading).background(.white).cornerRadius(5).frame(height: 80)
                
            }
            
            
            Button(action: {login()}, label: {Text("Sign in").foregroundColor(.yellow).frame(width: 120,height:33,alignment: .center).background(Color(color2)).cornerRadius(14).padding(.horizontal,30)})
        }.frame(height: 235).frame(maxWidth: .infinity).background(Color(color5)).clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous)).shadow(color: Color.black.opacity(0.2), radius: 20).offset(y:60).padding(.horizontal,20)    }


    var loginView: some View{
        VStack{
            
            HStack{
                Image(systemName: "person.crop.circle.fill").foregroundColor(Color(#colorLiteral(red: 0.6729827523, green: 0.9283120632, blue: 0.716257751, alpha: 1)
                                                                                  )).frame(width:44,height:44).font(.system(size: 24,weight: .bold ))
                    .background(Color(color4)).clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous)).shadow(color: Color(color3), radius: 5, x: 0,y: 5)
                TextField("Your email".uppercased(), text: $email).keyboardType(.emailAddress).frame(width:270,height:32,alignment: .leading).background(.white).cornerRadius(5).frame(height: 60)
                
            }
            HStack{
                Image(systemName: "lock.fill").foregroundColor(Color(#colorLiteral(red: 0.6729827523, green: 0.9283120632, blue: 0.716257751, alpha: 1)
                                                                    )).frame(width:44,height:44).font(.system(size: 24,weight: .bold ))                           .background(Color(color4)).clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous)).shadow(color: Color(color3), radius: 5, x: 0,y: 5)
                SecureField("Your password".uppercased(), text: $password).keyboardType(.emailAddress).frame(width:270,height:42,alignment: .leading).background(.white).cornerRadius(5).frame(height: 80)
                
            }
            
            
            Button(action: {login()}, label: {Text("Sign in").foregroundColor(.yellow).frame(width: 120,height:33,alignment: .center).background(Color(color2)).cornerRadius(14).padding(.horizontal,30)})
        }.frame(height: 235).frame(maxWidth: .infinity).background(Color(color5)).clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous)).shadow(color: Color.black.opacity(0.2), radius: 20).offset(y:60).padding(.horizontal,20)    }
}
    /*
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(email: "",createEmail: "", password:"",createPassword: "", showLogin: .constant(false), text: "", showCreateAccount: false).environmentObject(FirestoreManager())
        
        
        
        
        //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
