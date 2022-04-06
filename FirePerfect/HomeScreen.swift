//
//  HomeScreen.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI
import Firebase


struct HomeScreen: View {
    @EnvironmentObject var session: SessionStore
   
    @State var isLoading = false
    
    func doSignOut() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    

    var body: some View {
        NavigationView{
            VStack{
               
                if let email = session.session?.email{
                    Text("Welcome" + email)
                }
                
            }
            
        }
 
                .navigationBarItems(trailing: HStack{
                  
                    Button(action: {
                        
                    },
                     label: {
                        Image("ic_cancel")
                    })

                    Button {
                       doSignOut()
                    } label: {
                        Image("ic_logout")
                    }

                })
                .navigationBarTitle("Posts", displayMode: .inline)
        }
    
        
    }


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
