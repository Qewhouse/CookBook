//
//  FavoriteViewController.swift
//  CookBook
//
//  Created by Alexander Altman on 26.02.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    // TableView
    var tableView = UITableView()
    
    // Indentifire
    var indentifireMenu = "Cell"
    
    // MenuArray
    var menuArray = ["Cookie","Cake","Pasta","Meat","Soup","Fish","Vegetables","Desert"] // массив для блюд (должен приходить из API)

    //ingredients
    var ingredientsArray = ["1","2","3","4","5","6","7","8"]
    
    //ImageArray
    var imageArray = "AppIcon" //переделается в массив UIImage
    
    var networkManager = NetworkManager()
    var recipe: RecipeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        setupNavigationDar()
        setupConstraints()
        view.addSubview(tableView)

    }
}
//MARK: - TableView
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    //создание TableView
    func createTable() {
        view.addSubview(tableView)
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
        menuArray.count
    }
    
    //установка текста и изображения в TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifireMenu, for: indexPath)
        let menuText = menuArray[indexPath.row]
        let imageView = imageArray
        let ingredients = ingredientsArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = menuText //устанавливаем навзвание блюда
        content.secondaryText = ingredients // устанавливаем ингридиенты
        content.image = UIImage(named: imageView) //устанавливаем изображение
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
    
//    Захват выбранной строки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let numberMenu = indexPath.row
        print(numberMenu)
        
        networkManager.fetchRecipes(ApiURL.randomSearch(number: 1, tags: ["Dinner"])) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let recipe):
                    self.recipe = recipe
                    if let recipe = recipe.recipes?.first {
                        self.present(RecipeDetailViewController(with: recipe, index: indexPath), animated: true)
                    }
                case .failure(let error):
                    let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
                        return
                    }
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
            }
        }
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
//MARK: - настройка NavigationBar

extension FavoriteViewController {
    
    func setupNavigationDar () {
        //установка хэдера
        let label = UILabel()
        label.text = "Favorite"
        label.textColor = .orange
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 50)
        navigationItem.titleView = label
        navigationController?.navigationBar.backgroundColor = .none
    }
}
//MARK: -  constaints
extension FavoriteViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
