//
//  ViewCode.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

protocol ViewCode {
    func setup()
    func viewHierarchy()
    func setupConstraints()
}

extension ViewCode {
    func setup() {
        viewHierarchy()
        setupConstraints()
    }
}
