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
    
    // Array
    var menuArray = ["Cookie","Cake","Pasta","Meat","Soup","Fish","Vegetables","Desert"] // массив для блюд (должен приходить из API)

    override func viewDidLoad() {
        super.viewDidLoad()
        crateTable()
        view.addSubview(tableView)

    }
}
//MARK: - TableView
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    //создание TableView
    func crateTable() {
        view.addSubview(tableView)
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifireMenu)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    //установка количество строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuArray.count
    }
    
    //установка текста в TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifireMenu, for: indexPath)
        let menuText = menuArray[indexPath.row]
        cell.textLabel?.text = menuText //Установка текста из массива строки
        cell.accessoryType = .detailDisclosureButton // добавление доп инф
        return cell
    }
    
    //Высота строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    // Раскрытие доп информации (1 способ перехода в расширение рецепта)
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let ounerCell = tableView.cellForRow(at: indexPath)
        print(ounerCell?.textLabel?.text ?? "no inf")
    }
    
//    Захват выбранной строки
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let numberMenu = indexPath.row
//        print(numberMenu)
//    }
    
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



