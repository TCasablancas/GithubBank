//
//  Owner.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation
import ObjectMapper

struct Owner: Mappable {
    var login: String?
    var avatar_url: String?
    
    init?(map: Map) {
        login = (try? map.value("login")) ?? ""
        avatar_url = (try? map.value("avatar_url")) ?? ""
    }
    
    mutating func mapping(map: Map) {
        login      <- map["login"]
        avatar_url <- map["avatar_url"]
    }
}
