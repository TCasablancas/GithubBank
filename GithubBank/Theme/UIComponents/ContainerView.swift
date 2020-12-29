//
//  ContainerView.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit
import SnapKit

class ContainerView: UIView {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = Constants.default.borderGray.cgColor
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContainerView: ViewCode {
    func viewHierarchy() {
        self.addSubview(container)
    }
    
    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }
    }
}
