//
//  PopularCategoryButtonCollectionView.swift
//  CookBook
//
//  Created by Михаил Позялов on 02.03.2023.
//

import UIKit

class PopularCategoryButtonCollectionViewCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
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
        backgroundColor = Theme.yellowColor
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func setupView() {
        layer.cornerRadius = Theme.buttonCornerRadius

        addSubview(button)
    }
    
    func configureCell(buttonName: String) {
        button.setTitle(buttonName, for: .normal)
    }
    
    @objc func updateUI() {
        backgroundColor = .none
    }
  
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
    }
}
