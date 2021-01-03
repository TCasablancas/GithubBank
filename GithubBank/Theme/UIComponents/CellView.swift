//
//  CellView.swift
//  GithubBank
//
//  Created by Thyago on 30/12/20.
//

import UIKit
import SnapKit

class CellView: UIView {
    
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var cellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.default.bgCellGray
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.default.borderGray.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainComponents, ownerData])
        stackView.axis = .horizontal
        return stackView
    }()
    
    public lazy var mainComponents: MainComponents = {
        let main = MainComponents()
        return main
    }()
    
    public lazy var ownerData: OwnerData = {
        let owner = OwnerData()
        return owner
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellView: ViewCode {
    func viewHierarchy() {
        self.addSubview(container)
        container.addSubview(cellContainer)
        cellContainer.addSubview(stackView)
    }
    
    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cellContainer.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        mainComponents.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(ownerData.snp.left)
        }
        
        ownerData.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(110)
        }
    }
}
