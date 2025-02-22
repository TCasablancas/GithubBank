//
//  Repository.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation
import ObjectMapper

struct Repository: Mappable, Equatable {
    var name: String?
    var description: String?
    var stargazers_count: Int?
    var full_name: String?
    var owner: Owner?
    
    //MARK: - Retrieve Owner Data
    var avatar: String? { owner?.avatar_url }
    var developer: String? { owner?.login }
    
    //MARK: - Initializer for Tests
    init(name: String? = nil, description: String? = nil, stargazers_count: Int? = nil, full_name: String? = nil, owner: Owner? = nil) {
        self.name = name
        self.description = description
        self.stargazers_count = stargazers_count
        self.full_name = full_name
        self.owner = owner
    }
    
    init?(map: Map) {
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        stargazers_count = (try? map.value("stargazers_count")) ?? 0
        full_name = (try? map.value("full_name")) ?? ""
        owner = (try? map.value("owner"))
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        stargazers_count <- map["stargazers_count"]
        full_name <- map["full_name"]
        owner <- map["owner"]
    }
    
    //MARK: - Test Data Comparative
    static func == (lhs: Repository, rhs: Repository) -> Bool {
        lhs.avatar == rhs.avatar
    }
}
