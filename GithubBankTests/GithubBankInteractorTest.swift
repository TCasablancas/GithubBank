//
//  GithubBankInteractorTest.swift
//  GithubBankTests
//
//  Created by Thyago on 03/01/21.
//

import XCTest
@testable import GithubBank

class GithubBankInteractorTest: XCTestCase {

    func testInteractorDidGetData() {
        /// Given
        let repository = Repository(name: "Alamofire", description: nil, stargazers_count: 1000)
        let mainData = MainData(total_count: 1, incomplete_results: false, items: [repository])
        
        let spy = MainInteractorOutputSpy()
        let stub = WorkerStub(response: .success(model: mainData))
        let sut = MainInteractor(output: spy, worker: stub)
        
        /// When
        sut.getData()

        /// Then
        XCTAssertEqual(spy.repositoriesCall, [[repository]])
        XCTAssertEqual(spy.messages, [.load, .success])
    }
    
    func testInteractorDidGetTimeout() {
        let spy = MainInteractorOutputSpy()
        let stub = WorkerStub(response: .timeOut(description: ServerError(msgError: "timeout", statusCode: 1001)))
        let sut = MainInteractor(output: spy, worker: stub)
    
        sut.getData()
        
        XCTAssertEqual(spy.errorsCall, ["Timeout"])
        XCTAssertEqual(spy.messages, [.load, .error])
    }
    
    func testInteractorDidGetTimeoutAndOffline() {
        let spy = MainInteractorOutputSpy()
        let stub = WorkerStub(response: .timeOut(description: ServerError(msgError: "timeout", statusCode: 1001)))
        let sut = MainInteractor(output: spy, worker: stub)
        
        sut.getData()
        
        XCTAssertEqual(spy.errorsCall, ["Timeout"])
        XCTAssertEqual(spy.messages, [.load, .error])
        
        stub.response = .noConnection(description: ServerError(msgError: "offline", statusCode: 1002))
        
        sut.getData()
        
        XCTAssertEqual(spy.errorsCall, ["Timeout", "Offline"])
        XCTAssertEqual(spy.messages, [.load, .error, .load, .error])
    }
}

private class MainInteractorOutputSpy: MainInteractorOutput {
    enum Messages {
        case load
        case success
        case error
    }
    
    private(set) var messages = [Messages]()
    
    private(set) var didStartLoaderCall = false
    func didStartLoading(_ show: Bool) {
        messages.append(.load)
    }
    
    private(set) var repositoriesCall = [[Repository]]()
    func didGetData(_ repositories: [Repository]) {
        repositoriesCall.append(repositories)
        messages.append(.success)
    }
    
    private(set) var errorsCall = [String]()
    func didGetError(_ error: String) {
        errorsCall.append(error)
        messages.append(.error)
    }
}

private class WorkerStub: Worker {
    var response: Response<MainData>
    
    init(response: Response<MainData>) {
        self.response = response
    }
    
    override func getreposList(completion: @escaping (Response<MainData>) -> Void) {
        completion(response)
    }
}
