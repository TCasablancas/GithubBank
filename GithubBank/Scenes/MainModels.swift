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
            var avatar: String?
            var developer: String?
        }
        
        struct ViewModel {
            let name: String?
            let description: String?
            let stars: Int?
            let avatar: String?
            let developer: String?
        }
    }
}
