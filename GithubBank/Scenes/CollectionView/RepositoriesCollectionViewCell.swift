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
    
    // MARK: - UI Components
    
    private lazy var cellComponent: CellView = {
        let view = CellView()
        return view
    }()
    
    private lazy var mainView: MainComponents = {
        let view = MainComponents()
        return view
    }()
    
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
            self.mainView.title.text = repository.name
            self.mainView.repoDescription.text = repository.description
        }
    }
}

extension RepositoriesCollectionViewCell: ViewCode {
    func viewHierarchy() {
        self.addSubview(cellComponent)
    }
    
    func setupConstraints() {
        cellComponent.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    
}
