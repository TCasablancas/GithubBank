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
        
        let cell = self.cellComponent
        
        DispatchQueue.main.async {
            cell.mainComponents.title.text = repository.name
            cell.mainComponents.repoDescription.text = repository.description
            cell.ownerData.ownerAvatar.image = UIImage(named: repository.avatar ?? "")
            cell.ownerData.ownerName.text = repository.developer
            
            let starsCount = repository.stars.flatMap(String.init)
            let starsConverted = starsCount?.formatNumber(repository.stars!)
            cell.mainComponents.stars.counter.text = starsConverted
            
            if let url = URL(string: repository.avatar ?? "") {
                cell.ownerData.ownerAvatar.kf.indicatorType = .activity
                cell.ownerData.ownerAvatar.kf.setImage(with: url)
            } else {
                cell.ownerData.ownerAvatar.image = UIImage(named: "")
            }
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
