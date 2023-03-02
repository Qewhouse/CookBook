//
//  RecentRecipeCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class RecentRecipeCollectionViewCell: UICollectionViewCell {
    
    private let backImageView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recentRecipeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recipeNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let creatorNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = Theme.whiteColor
        
        addSubview(backImageView)
        backImageView.addSubview(recentRecipeImageView)
        addSubview(recipeNameLabel)
        addSubview(creatorNameLabel)
    }
    
    func configureCell(recipeImageName: String, recipeName: String, creatorName: String) {
        recentRecipeImageView.image = UIImage(named: recipeImageName)
        recipeNameLabel.text = recipeName
        creatorNameLabel.text = "By \(creatorName)"
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backImageView.heightAnchor.constraint(equalToConstant: 150),
            backImageView.bottomAnchor.constraint(equalTo: recipeNameLabel.topAnchor, constant: -5),
            
            recentRecipeImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 0),
            recentRecipeImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 0),
            recentRecipeImageView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 0),
            recentRecipeImageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0),
            
            recipeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeNameLabel.bottomAnchor.constraint(equalTo: creatorNameLabel.topAnchor, constant: -5),
            
            creatorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            creatorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            creatorNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            creatorNameLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
    }
}
