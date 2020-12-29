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
    
    var worker: Worker = Worker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
