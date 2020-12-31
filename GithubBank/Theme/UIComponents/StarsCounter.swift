//
//  StarsCounter.swift
//  GithubBank
//
//  Created by Thyago on 30/12/20.
//

import UIKit
import SnapKit
import FontAwesome_swift

class StarsCounter: UIView {
    
    private lazy var container: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconContainer, counter])
        view.layer.cornerRadius = 7
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.default.borderGray.cgColor
        return view
    }()
    
    private lazy var iconContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [icon])
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.fontAwesomeIcon(
            name: .star,
            style: .light,
            textColor: Constants.default.iconColor,
            size: CGSize(width: 16, height: 25))
        return imageView
    }()
    
    public lazy var counter: UILabel = {
        let label = UILabel()
        label.text = "3220"
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 13.0)
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = Constants.default.borderGray.cgColor
        label.layer.masksToBounds = true
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
            make.width.equalTo(90)
            make.height.equalTo(30)
            make.right.equalToSuperview()
        }
        
        iconContainer.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.right.equalTo(counter.snp.left).offset(-8)
        }
        
        icon.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(18)
            make.height.equalTo(15)
        }
        
        counter.snp.makeConstraints { make in
            make.left.equalTo(iconContainer.snp.right)
        }
    }
}
