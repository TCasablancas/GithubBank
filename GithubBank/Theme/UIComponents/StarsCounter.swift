//
//  StarsCounter.swift
//  GithubBank
//
//  Created by Thyago on 30/12/20.
//

import UIKit
import SnapKit

class StarsCounter: UIView {
    
    private lazy var container: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconContainer, counter])
        return view
    }()
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var counter: UILabel = {
        let label = UILabel()
        label.text = "3220"
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

extension StarsCounter: ViewCode {
    func viewHierarchy() {
        self.addSubview(container)
        iconContainer.addSubview(icon)
    }
    
    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        
        iconContainer.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.right.equalTo(counter.snp.left)
        }
        
        icon.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        counter.snp.makeConstraints { make in
            make.left.equalTo(iconContainer.snp.right)
        }
    }
}
