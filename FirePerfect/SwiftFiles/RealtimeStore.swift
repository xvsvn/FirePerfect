//
//  RealtimeStore.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//


import SwiftUI
import Firebase
import FirebaseDatabase

class RealtimeStore: ObservableObject {
    var ref: DatabaseReference = Database.database().reference(withPath: "posts")
    @Published var items: [Post] = []
    
    func storePost(post: Post, completion: @escaping (_ success: Bool) -> ()){
        var success = true
        let toBePosted = ["firstname": post.firstname!, "lastname": post.lastname!, "phone": post.phone]
        
        ref.childByAutoId().setValue(toBePosted) { error, ref -> Void in
            if error != nil {
                success = false
            }
        }
        completion(success)
    }
    
    func loadPosts(completion: @escaping () -> ()) {
        ref.observe(DataEventType.value) { snapshot in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    let value = snapshot.value as? [String: AnyObject]
                    let firstname = value!["firstname"] as? String
                    let lastname = value!["lastname"] as? String
                    let phone = value!["phone"] as? String
                    let imgUrl = value!["imgUrl"] as? String
                    self.items.append(Post(firstname: firstname, lastname: lastname, phone: phone, imgUrl: imgUrl))
                }
            }
            completion()
        }
    }
}
