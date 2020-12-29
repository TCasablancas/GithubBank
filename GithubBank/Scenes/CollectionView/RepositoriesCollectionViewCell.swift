//
//  RepositoriesCollectionViewCell.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit
import SnapKit
import Kingfisher

protocol RepositoriesCollectionViewCellDelegate: AnyObject {
    func routeToRepository(_ repository: MainModels.RepositoryView.ViewModel)
}

class RepositoriesCollectionViewCell: UICollectionViewCell {
    
    public weak var delegate: RepositoriesCollectionViewCellDelegate?
    private var repository: MainModels.RepositoryView.ViewModel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureWith(with repository: MainModels.RepositoryView.ViewModel) {
        self.repository = repository
        
        DispatchQueue.main.async {
            
        }
    }
}

extension RepositoriesCollectionViewCell: ViewCode {
    func viewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
}
