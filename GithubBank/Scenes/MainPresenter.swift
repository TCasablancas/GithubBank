//
//  MainPresenter.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit

protocol MainPresenterOutput: AnyObject {
    func displayStartLoading(_ show: Bool)
    func displayRepositories(viewModel: [MainModels.RepositoryView.ViewModel])
    func displayError(error: String)
}

class MainPresenter: MainInteractorOutput {

    weak var output: MainPresenterOutput?
    var viewController: RepositoriesCollectionView?
    
    func didStartLoading(_ show: Bool) {
        output?.displayStartLoading(true)
    }
    
    func didGetData(_ repositories: [Repository]) {
        let viewModel = repositories.map({
            MainModels.RepositoryView.ViewModel(
                name: $0.name,
                description: $0.description,
                stars: $0.stargazers_count,
                avatar: $0.avatar,
                developer: $0.developer)
        })
        
        output?.displayRepositories(viewModel: viewModel)
    }
    
    func didGetError(_ error: String) {
        output?.displayError(error: error)
    }
}
