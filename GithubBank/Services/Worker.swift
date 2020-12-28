//
//  Worker.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import Foundation
import Alamofire
import ObjectMapper

class Worker: Request {
    
    func getreposList(completion: @escaping (_ response: Response<MainData>) -> Void) {
        let url = Endpoints.getReposEndpoint
        
        Alamofire.request(url).responseJSON { (data: DataResponse<Any>) in
            let statusCode = data.response?.statusCode
            
            switch data.result {
            case .success(let value):
                guard let resultValue = value as? [String:Any] else { return }
                
                if statusCode == 200 {
                    let model = Mapper<MainData>().map(JSON: resultValue)
                    completion(.success(model: model!))
                }
            case .failure(let error):
                let errorCode = error._code
                if errorCode == -1009 {
                    let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                    completion(.noConnection(description: erro))
                } else if errorCode == -1001 {
                    let erro = ServerError(msgError: error.localizedDescription, statusCode: errorCode)
                    completion(.timeOut(description: erro))
                }
            }
        }
    }
}
