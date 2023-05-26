//
//  ViewController.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController,  UISearchBarDelegate {
    
    private var searchBar: UISearchBar!
    private var textFieldContainer: UIView!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarUI()
        myTableView.dataSource = self
        myTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10)
        ])
    }
    
    
    // Search bar set up using tiny constraints
    func setSearchBarUI() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.tintColor = .gray
        
        textFieldContainer = UIView()
        textFieldContainer.backgroundColor = .white
        textFieldContainer.layer.cornerRadius = 8.0
        
        let barcodeButton = UIButton()
        barcodeButton.setImage(UIImage(systemName: "barcode.viewfinder"), for: .normal)
        barcodeButton.tintColor = .gray
        barcodeButton.addTarget(self, action: #selector(barcodeButtonTapped), for: .touchUpInside)
        searchBar.addSubview(barcodeButton)
        
        textFieldContainer.addSubview(searchBar)
        view.addSubview(textFieldContainer)
        
        searchBar.edgesToSuperview(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 15))
        barcodeButton.edgesToSuperview(excluding: .left)
        barcodeButton.width(44)
        textFieldContainer.edgesToSuperview(excluding: .bottom, insets: UIEdgeInsets(top: UIScreen.main.bounds.height/14, left: 16, bottom: 0, right: 15))
        textFieldContainer.height(50)
    }
    
    @objc private func barcodeButtonTapped() {
        print("did Tap Bar code")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell1 = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            return cell1
        case 1:
            let cell = myTableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as!  BannerTableViewCell
            return cell
        case 2:
            let cell3 = myTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            return cell3
        default:
            return UITableViewCell()
        }
    }
}

