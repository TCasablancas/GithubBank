//
//  Repository.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation
import ObjectMapper

struct Repository: Mappable {
    var name: String?
    var url: String?
    var description: String?
    var stargazers_count: Int?
    var forks_count: Int?
    var full_name: String?
    var owner: Owner?
    
    init?(map: Map) {
        name = (try? map.value("name")) ?? ""
        url = (try? map.value("url")) ?? ""
        description = (try? map.value("description")) ?? ""
        stargazers_count = (try? map.value("stargazers_count")) ?? 0
        forks_count = (try? map.value("forks_count")) ?? 0
        full_name = (try? map.value("full_name")) ?? ""
        owner = (try? map.value("owner"))
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
        description <- map["description"]
        stargazers_count <- map["stargazers_count"]
        forks_count <- map["forks_count"]
        full_name <- map["full_name"]
        owner <- map["owner"]
    }
}
