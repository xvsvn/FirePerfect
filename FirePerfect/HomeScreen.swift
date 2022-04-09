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
    @ObservedObject var database = RealtimeStore()
    @State var isLoading = false
    
    func doSignOut() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    
    func apiPosts() {
        isLoading = true
        database.loadPosts {
            print(database.items.count)
            isLoading = false
        }
    }
    var body: some View {
        NavigationView{
            ZStack{
                List {
                    ForEach(database.items, id: \.self) { item in
                        PostCell(post: item)
                    }
                }.listStyle(PlainListStyle())
                
                if isLoading {
                    ProgressView()
                }
            }
            
                .navigationBarTitle("Posts", displayMode: .inline)
                .navigationBarItems(trailing: HStack{
                    NavigationLink {
                        AddPostScreen()
                    } label: {
                        Image("ic_cancel")
                    }

                    Button {
                       doSignOut()
                    } label: {
                        Image("ic_logout")
                    }

                }).foregroundColor(.black)
                .onAppear {
                    apiPosts()
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
