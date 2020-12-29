//
//  RepositoriesCollectionView.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit
import SnapKit

private let reuseIdentifier = "RepositoriesCollectionViewCell"

class RepositoriesCollectionView: UICollectionViewController {
    
    private let interactor: MainInteractorBusinessLogic
    public lazy var repository: [MainModels.RepositoryView.ViewModel] = []
    var didSelect: (MainModels.RepositoryView.ViewModel) -> Void = { _ in }
    
    init(interactor: MainInteractor) {
        self.interactor = interactor
        
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        
        super.init(collectionViewLayout: flow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        interactor.getData()
    }
    
    private func configureCollectionView() {
        collectionView.register(RepositoriesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.backgroundColor = Constants.default.bgGray
    }
}
