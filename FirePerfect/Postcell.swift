//
//  Postcell.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View {
        HStack{
            if post.imgUrl != nil {
                WebImage(url: URL(string: post.imgUrl!))
                    .resizable().frame(width: 100, height: 100)
            } else {
                Image(systemName: "person.fill").resizable().frame(width: 100, height: 100)
                    .background(.gray.opacity(0.3))
            }
            VStack(alignment: .leading){
                HStack{
                    Text((post.firstname ?? "first").uppercased())
                        .fontWeight(.bold).font(.system(size: 16))
                    Text((post.lastname ?? "last").uppercased())
                        .fontWeight(.bold).font(.system(size: 16))
                    Spacer()
                }.foregroundColor(.red)
                
                Text(post.phone ?? "phone").font(.system(size: 14))
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(firstname: "firstname", lastname: "lastname", phone: "phone"))
    }
}
