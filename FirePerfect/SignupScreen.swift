//
//  SignupScreen.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI

struct SignupScreen: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    
    func doSignUp() {
        isLoading = true
        SessionStore().signUp(email: email, password: password) { res, err in
            isLoading = false
            if err != nil {
                print("User not created")
                return
            }
            session.listen()
            print("User created")
            self.presentation.wrappedValue.dismiss()
        }
    }
    var body: some View {
        VStack {
            Spacer()
            Text("Create your account")
                .font(.system(size: 30)).foregroundColor(.red)
            TextField("Fullname", text: $fullname)
                .padding().background(.gray.opacity(0.2)).cornerRadius(30)
            TextField("email", text: $email)
                .padding().background(.gray.opacity(0.2)).cornerRadius(30)
            SecureField("password", text: $password)
                .padding().background(.gray.opacity(0.2)).cornerRadius(30)
            Button {
                doSignUp()
            } label: {
                Spacer()
                Text("Sign Up")
                Spacer()
            }.padding().background(.red).foregroundColor(.white).cornerRadius(30)
            Spacer()
            HStack{
                Text("Already have an account?")
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Sign In")
                        .foregroundColor(.red)
                }
            }
        }.padding()
        if isLoading {
            ProgressView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
