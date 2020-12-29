//
//  MainModels.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import Foundation

struct MainModels {
    struct RepositoryView {
        struct Request { }
        
        struct Response {
            var name: String?
            var description: String?
            var stars: Int?
            var forks: Int?
            var avatar: String?
            var developer: String?
            var full_name: String?
        }
        
        struct ViewModel {
            let name: String?
            let description: String?
            let stars: Int?
            let forks: Int?
            let avatar: String?
            let developer: String?
            let full_name: String?
        }
    }
}
