//
//  Post.swift
//  FirePerfect
//
//  Created by Xasan Xasanov on 06/04/22.
//

import Foundation

struct Post: Hashable {
    var firstname: String?
    var lastname: String?
    var phone: String?
    var imgUrl: String?
    
    init(firstname: String?, lastname: String?, phone: String?) {
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
    }
    
    init(firstname: String?, lastname: String?, phone: String?, imgUrl: String?) {
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
        self.imgUrl = imgUrl
    }
}
