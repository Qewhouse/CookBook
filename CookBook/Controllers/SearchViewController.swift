//
//  SearchViewController.swift
//  CookBook
//
//  Created by Alexander Altman on 26.02.2023.
//

import UIKit

class SearchViewController: UIViewController  {

    //MARK: - Search + TableView
    
    weak var delegate : SearchViewController?
    var searchController = UISearchController()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        definesPresentationContext = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self as? any UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true

        let searchBar = searchController.searchBar
        searchBar.layer.cornerRadius = 11
        searchBar.layer.masksToBounds = true
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor =  #colorLiteral(red: 0.9764705882, green: 0.8649476278, blue: 0.462739784, alpha: 1)
        searchBar.isTranslucent = true
        searchBar.barTintColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Search recipes"
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search recipes", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9764705882, green: 0.8666666667, blue: 0.462745098, alpha: 1) ])

        view.addSubview(searchBar)

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            searchBar.heightAnchor.constraint(equalToConstant: 57)
        ])

        tableView = UITableView()
        tableView.dataSource = self as? any UITableViewDataSource
        tableView.delegate = self as? any UITableViewDelegate
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}

import SwiftUI
struct ListProvider1: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = SearchViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider1.ContainterView>) -> SearchViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider1.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider1.ContainterView>) {
        }
    }
}
