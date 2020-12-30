//
//  ViewController.swift
//  GithubBank
//
//  Created by Thyago on 28/12/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.default.bgGray
        return view
    }()
    
    lazy var viewContainer: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: viewContainer.bounds, collectionViewLayout: flowLayout)
        collection.register(RepositoriesCollectionViewCell.self, forCellWithReuseIdentifier: "RepositoriesCollectionViewCell")
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    public lazy var repositories: [MainModels.RepositoryView.ViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "RepositoriesCollectionViewCell", for: indexPath) as! RepositoriesCollectionViewCell
        
        let indexPath = indexPath.row
        let item = repositories[indexPath]
        cell.configureWith(with: item)
//        cell.delegate = self
        
        print(item)
        
        return cell
    }
    
    
}

extension ViewController: ViewCode {
    func viewHierarchy() {
        self.view.addSubview(mainView)
        mainView.addSubview(viewContainer)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        viewContainer.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    
}
