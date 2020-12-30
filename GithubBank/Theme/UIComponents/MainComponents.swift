//
//  MainComponents.swift
//  GithubBank
//
//  Created by Thyago on 30/12/20.
//

import UIKit
import SnapKit

class MainComponents: UIView {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStack, repoDescription])
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, stars])
        stackView.axis = .horizontal
        return stackView
    }()
    
    public lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Main Title"
        return title
    }()
    
    private lazy var stars: StarsCounter = {
        let stars = StarsCounter()
        return stars
    }()

    public lazy var repoDescription: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet..."
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

extension MainComponents: ViewCode {
    func viewHierarchy() {
        self.addSubview(mainStackView)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        titleStack.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(repoDescription.snp.top)
        }
        
        title.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(stars.snp.left)
        }
        
        stars.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        repoDescription.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(titleStack.snp.bottom).offset(10)
        }
    }
    
    
}
