//
//  Response.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation

enum Response<T> {
    case success(model: T)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
}
