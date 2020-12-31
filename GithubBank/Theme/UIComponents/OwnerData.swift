//
//  OwnerData.swift
//  GithubBank
//
//  Created by Thyago on 30/12/20.
//

import UIKit
import SnapKit

class OwnerData: UIView {
    
    // MARK: - UIComponents
    
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [avatarContainer, ownerName])
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var avatarContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var ownerAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.backgroundColor = Constants.default.bgGray
        return imageView
    }()
    
    public lazy var ownerName: UILabel = {
        let label = UILabel()
        label.text = "Jon Doe"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto-Regular", size: 13.0)
        label.textColor = Constants.default.ownerName
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OwnerData: ViewCode {
    func viewHierarchy() {
        self.addSubview(container)
        container.addSubview(stackView)
        avatarContainer.addSubview(ownerAvatar)
    }
    
    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        avatarContainer.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.top.equalToSuperview().offset(10)
        }
        
        ownerAvatar.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        ownerName.snp.makeConstraints { make in
            make.top.equalTo(avatarContainer.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.bottom.equalToSuperview()
            
        }
    }
    
    
}
