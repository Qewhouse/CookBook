//
//  PopularCategoryButtonCollectionView.swift
//  CookBook
//
//  Created by Михаил Позялов on 02.03.2023.
//

import UIKit

class PopularCategoryButtonCollectionViewCell: UICollectionViewCell {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .none
        button.layer.cornerRadius = 10
        button.tintColor = .gray
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
        
    }
    
    func setupView() {
        backgroundColor = .none

        addSubview(button)
    }
    
    func configureCell(buttonName: String) {
        button.setTitle(buttonName, for: .normal)
    }
    
    func isSelected() {
        if button.isSelected {
            button.backgroundColor = Theme.yellowColor
            button.tintColor = .white
        }
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
