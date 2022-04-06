//
//  SigninScreen.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI

struct SigninScreen: View {
    
    @EnvironmentObject var session: SessionStore
      @State var isLoading = false
      @State var isModal = false
      @State var email = ""
      @State var password = ""
      
      func doSignIn() {
          isLoading = true
          SessionStore().signIn(email: email, password: password) { res, err in
              isLoading = false
              if err != nil {
                  print("Check email or password")
                  return
              }
              session.listen()
              print("User signed in")
          }
      }
      var body: some View {
          VStack {
              Spacer()
              Text("Welcome Back")
                  .font(.system(size: 30)).foregroundColor(.red)
              TextField("email", text: $email)
                  .padding().background(.gray.opacity(0.2)).cornerRadius(30).keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
              SecureField("password", text: $password)
                  .padding().background(.gray.opacity(0.2)).cornerRadius(30)
              Button {
                  doSignIn()
              } label: {
                  Spacer()
                  Text("Sign In")
                  Spacer()
              }.padding().background(.red).foregroundColor(.white).cornerRadius(30)
              Spacer()
              HStack{
                  Text("Don't have an account")
                  Button {
                      self.isModal = true
                  } label: {
                      Text("Sign Up").foregroundColor(.red)
                  }.sheet(isPresented: $isModal) {
                      SignupScreen()
                  }

                  
              }
          }
          .padding()
          if isLoading{
              ProgressView()
          }
      }
  }

  struct SignInView_Previews: PreviewProvider {
      static var previews: some View {
          SigninScreen()
      }
  }
