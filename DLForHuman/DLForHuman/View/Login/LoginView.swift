//
//  LoginView.swift
//  DLForHuman
//
//  Created by admin on 7/6/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import SwiftUI
import ActivityIndicatorView
struct LoginView: View {
    @Binding var showLoad : Bool
    @State var user = ""
    @State var pass = ""
    @State private var showError = false
    @Binding var signInSuccess: Bool
    @ObservedObject var data = FetchUser()
    @Binding var share : FetchUser
    var body: some View {
        VStack{
            Image("logo")
            Text("Log In").fontWeight(.heavy).font(.largeTitle).padding([.top , .bottom] , 20)
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("Student ID").font(.headline).fontWeight(.light).foregroundColor(Color.black.opacity(0.75))
                    HStack {
                        TextField("Enter ID" , text :$user)
                        
                    }
                    Divider()
                }.padding(.bottom , 15)
                VStack(alignment: .leading) {
                    Text("Password").font(.headline).fontWeight(.light)
                 
                    SecureField("Enter password" , text :$pass).foregroundColor(Color.black.opacity(0.75)).keyboardType(UIKeyboardType.asciiCapable)
                    
                        Divider()
                    
                   
                }
             
              
            }.padding(.horizontal , 6)
            VStack {
                Button(action:  {
                    data.fetchData(id: self.user, password: self.pass ) {
                        
                        if data.isAuthorized {
                            self.share = data
                            print("signSuccess")
                            self.signInSuccess = true
                        }
                        else{

                            self.showError = true
                        }
                    }
                   
                  
                   
                    
                }) {
                    Text("Log In").foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 120).padding()
                }.background(Color.red)
                .clipShape(Capsule())
                .padding(.top, 45)
            }
            .alert(isPresented: $showError){
                Alert(title: Text("Can't find such user"), message: Text("Please , check up your data and try again"), dismissButton: .default(Text("OK")))

            }
            
        }
        
       
    }
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(showLoad: , signInSuccess: <#T##Binding<Bool>#>)
//    }
//}
