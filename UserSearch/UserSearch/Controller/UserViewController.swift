//
//  ViewController.swift
//  UserSearch
//
//  Created by Test User on 10/08/19.
//  Copyright © 2019 Task. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var searchedText: String? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var users: [User]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
              self?.collectionView.reloadData()
          }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserManager.shared.fetchUser({ [weak self] users in
            self?.users = users
        })
    }
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.className, for: indexPath)
        
        if let userCell = cell as? UserCollectionViewCell, let user = users?[indexPath.row] {
            userCell.configure(user, searchText: self.searchedText)
        }
        return cell
    }
}

extension UserViewController: UICollectionViewDelegate {
    
}

extension UserViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchedText = searchBar.text
    }
}


