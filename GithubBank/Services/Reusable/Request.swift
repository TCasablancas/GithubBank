//
//  Request.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation
import Alamofire

class Request {
    let alamofireManager: SessionManager = {
        let configure = URLSessionConfiguration.default
        
        configure.timeoutIntervalForRequest = 1000
        configure.timeoutIntervalForResource = 1000
        
        return SessionManager(configuration: configure)
    }()
}
