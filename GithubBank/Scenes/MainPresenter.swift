//
//  MainPresenter.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit

protocol MainPresenterOutput: AnyObject {
    func displayStartLoading()
    func displayRepositories(viewModel: [MainModels.RepositoryView.ViewModel])
    func displayError(error: String)
}

class MainPresenter: MainInteractorOutput {
    weak var output: MainPresenterOutput?
    var viewController: RepositoriesCollectionView?
    
    func didStartLoading() {
        output?.displayStartLoading()
    }
    
    func didGetData(_ repositories: [Repository]) {
        let viewModel = repositories.map({
            MainModels.RepositoryView.ViewModel(
                name: $0.name,
                description: $0.description,
                stars: $0.stargazers_count,
                forks: $0.forks_count,
                avatar: $0.avatar,
                developer: $0.developer,
                full_name: $0.full_name)
        })
        
        output?.displayRepositories(viewModel: viewModel)
    }
    
    func didGetError(_ error: String) {
        output?.displayError(error: error)
    }
}
