//
//  RepositoriesCollectionView.swift
//  GithubBank
//
//  Created by Thyago on 29/12/20.
//

import UIKit
import SnapKit

private let reuseIdentifier = "RepositoriesCollectionViewCell"

class RepositoriesCollectionView: UICollectionViewController {
    // MARK: - UI Components
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.default.bgGray
        return view
    }()
    
    lazy var viewContainer: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.center = self.view.center
        activity.hidesWhenStopped = true
        activity.style = .large
        activity.startAnimating()
        return activity
    }()
    
    private let interactor: MainInteractorBusinessLogic
    public lazy var repositories: [MainModels.RepositoryView.ViewModel] = []
    var didSelect: (MainModels.RepositoryView.ViewModel) -> Void = { _ in }
    
    init(interactor: MainInteractor) {
        self.interactor = interactor
        
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 0
        
        super.init(collectionViewLayout: flow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        interactor.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func configureCollectionView() {
        collectionView.register(RepositoriesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.backgroundColor = Constants.default.bgGray
    }
    
    private func setupNavigationBar() {
        let navigation = self.navigationController?.navigationBar
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigation?.prefersLargeTitles = true
        navigation?.topItem?.title = "gitrepo"
//        navigation?.backgroundColor = Theme.default.gray
        navigation?.shadowImage = UIImage()
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
        
        for view in self.navigationController?.navigationBar.subviews ?? [] {
             let subviews = view.subviews
             if subviews.count > 0, let label = subviews[0] as? UILabel {
//                label.textColor = Theme.default.description
             }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RepositoriesCollectionViewCell
        
        let item = repositories[indexPath.item]
        cell.configureWith(with: item)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods

extension RepositoriesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 160)
    }
}

// MARK: - MainPresenterOutput Methods

extension RepositoriesCollectionView: MainPresenterOutput {
    func displayStartLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func displayRepositories(viewModel: [MainModels.RepositoryView.ViewModel]) {
        repositories = viewModel
        collectionView.reloadData()
    }
    
    func displayError(error: String) {
        print(error)
    }
}

extension RepositoriesCollectionView: ViewCode {
    func viewHierarchy() {
        self.view.addSubview(activityIndicator)
        self.view.addSubview(mainView)
        mainView.addSubview(viewContainer)
    }
    
    func setupConstraints() {
        mainView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        viewContainer.snp.makeConstraints { make in
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            
        }
    }
}
