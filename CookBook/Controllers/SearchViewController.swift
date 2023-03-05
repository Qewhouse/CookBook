//
//  SearchViewController.swift
//  CookBook
//
//  Created by Alexander Altman on 26.02.2023.
//

import UIKit

class SearchViewController: UIViewController  {
    
    //MARK: - Search + TableView
    
    var searchController = UISearchController(searchResultsController: nil)
    
    //
    var tableView = UITableView()
    
    // Indentifire
    var indentifireMenu = "Cell"
    
    //searchArray
    var searchArray = [String]()
    
    // MenuArray
    var menuArray = ["Cookie","Cake","Pasta","Meat","Soup","Fish","Vegetables","Desert"] // массив для блюд (должен приходить из API)

    //ingredients
    var ingredientsArray = ["1","2","3","4","5","6","7","8"]
    
    //ImageArray
    var imageArray = "AppIcon" //переделается в массив 
    
    //Search is empty
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        setupsearchBar()
        setupConstraints()
        view.addSubview(tableView)
        
    }
}

//MARK: - Search Bar
extension SearchViewController: UISearchResultsUpdating {
    func setupsearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "enter"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
//MARK: - Table View
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    //создание TableView
    func createTable() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifireMenu)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    //установка количество строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchArray.count
    }
    
    //установка текста и изображения в TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifireMenu, for: indexPath)
        let menuText = searchArray[indexPath.row]
//        let imageView = imageArray
//        let ingredients = ingredientsArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = menuText //устанавливаем навзвание блюда
//        content.secondaryText = ingredients // устанавливаем ингридиенты
//        content.image = UIImage(named: imageView) //устанавливаем изображение
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
    
//    Захват выбранной строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let numberMenu = indexPath.row
        print(numberMenu)
    }
    
    //удаление строк
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            menuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

//MARK: -  constaints
extension SearchViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
