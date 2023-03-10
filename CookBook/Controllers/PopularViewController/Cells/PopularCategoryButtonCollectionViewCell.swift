//
//  PopularCategoryButtonCollectionView.swift
//  CookBook
//
//  Created by Михаил Позялов on 02.03.2023.
//

//import UIKit
//
//class PopularCategoryButtonCollectionViewCell: UICollectionViewCell {
//
////     private lazy var mealLabel: UILabel = {
////        let label = UILabel()
////         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
////         label.translatesAutoresizingMaskIntoConstraints = false
////         return label
////    }()
//
//    private lazy var mealLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 10)
//        label.textColor = .label
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.text = "Loading..."
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupView()
//        setConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//    func setupView() {
//        addSubview(mealLabel)
//    }
//
//    func configureCell(buttonName: String) {
//        mealLabel.text = buttonName
//    }
//
//
//    func setConstraints() {
//
//        NSLayoutConstraint.activate([
//            mealLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            mealLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            mealLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            mealLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 0),
//
//        ])
//
//    }
//}

import UIKit

class PopularCategoryButtonCollectionViewCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .gray
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
//        backgroundColor = .none
//        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
//    @objc func updateUI() {
//        backgroundColor = Theme.yellowColor
//    }
    
    func setupView() {
        addSubview(button)
    }
    
    func configureCell(buttonName: String) {
        button.setTitle(buttonName, for: .normal)
    }
    
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: topAnchor, constant: 0),
            
        ])
        
    }
}
