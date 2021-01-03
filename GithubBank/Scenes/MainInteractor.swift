//
//  MainInteractor.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit

protocol MainInteractorBusinessLogic {
    func getData()
}

protocol MainInteractorOutput {
    func didStartLoading(_ show: Bool)
    func didGetData(_ repositories: [Repository])
    func didGetError(_ error: String)
}

class MainInteractor: MainInteractorBusinessLogic {
    let output: MainInteractorOutput
    let worker: WorkerDelegate
    
    init(output: MainInteractorOutput, worker: WorkerDelegate) {
        self.output = output
        self.worker = worker
    }
    
    func getData() {
        output.didStartLoading(true)
        
        self.worker.getreposList() { [output] (response) in
            switch response {
            case .success(let model):
                output.didGetData(model.items)
            case .serverError(let error):
                let errorData = "\(error.statusCode), -, \(error.msgError)"
                output.didGetError(errorData)
                print("Server error: \(errorData) \n")
                break
            case .timeOut(let description):
                print("Server error noConnection: \(description) \n")
                output.didGetError("Timeout")
                
            case .noConnection(let description):
                output.didGetError("Offline")
                print("Server error timeOut: \(description) \n")
            }
        }
    }
}
