//
//  Endpoints.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation

class Endpoints {
    static let basePath = "https://api.github.com/"
    static let search = "search/repositories?q=language:Swift"
    static var sort = "&sort=stars"
    
    public static var getReposEndpoint: String {
        get {
            return (basePath + search + sort)
        }
    }
}
