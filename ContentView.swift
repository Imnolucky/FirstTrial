//
//  ContentView.swift
//  overGreenWater
//
//  Created by 如在 on 2022/11/18.
//

import SwiftUI

let lightGreyColor = Color(red:239.0/255.0,green: 243.0/255.0,blue: 244.0/255.0)


struct ContentView: View
{
    
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationdidFalse: Bool = false
    @State var authenticationdidSuccess: Bool = false
    
    let storedAccount = "Star"
    let storedPassword = "Welcome"
    
    var body: some View
   {
        ZStack
       {
            VStack
            {
                QingshuiText()
                QIngshuiImage()
                UsernameTextField(username: $username)
                PasswordTextField(password: $password)
                Button (action: {
                        if self.username == storedAccount && self.password == storedPassword{
                             self.authenticationdidSuccess = true
                            self.authenticationdidFalse = false
                        }
                        else{
                            self.authenticationdidFalse = true
                            self.authenticationdidSuccess = false
                        }
                    }){LoginBottom()}
                
            }
           if authenticationdidFalse{
               Text("登陆失败，请重新登陆!")
                   .font(.callout)
                   .fontWeight(.regular)
                   .multilineTextAlignment(.center)
                   .padding()
                   .frame(width: 257.0, height: 93.0)
                   .background(Color.white)
                   .animation(Animation.default)
                   .shadow(color: .black, radius: 101)
                   
           }
           if authenticationdidSuccess{
           Text("登陆成功!")
                   .font(.callout)
                   .fontWeight(.regular)
                   .multilineTextAlignment(.center)
                   .frame(width: 257.0, height: 93.0)
                   .background(Color.white)
                   .animation(Animation.default)
                   .shadow(color: .black, radius: 101)
           }
               
                
                    
                    
                    
                
            }
       .padding()
          
          
          
           
      }
   }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QingshuiText: View {
    var body: some View {
        Text("清水河畔")
            .font(.title)
            .fontWeight(.light)
            .padding(.bottom,10)
    }
}

struct QIngshuiImage: View {
    var body: some View {
        Image("Qingshui")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
        
            .cornerRadius(150)
            .padding(.bottom,25)
    }
}

struct LoginBottom: View {
    var body: some View {
        Text("登陆")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 150, height: 50)
            .background(Color.black)
            .cornerRadius(35)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    
    var body: some View {
        TextField("账号",text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordTextField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("密码",text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}
