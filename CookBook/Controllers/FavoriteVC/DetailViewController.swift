//
//  DetailViewController.swift
//  CookBook
//
//  Created by Николай on 05.03.2023.
//

import UIKit
import Foundation

let svc = SearchViewController()

class DetailViewController: UIViewController {
    
    var recept = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = recept
        
    }
}
