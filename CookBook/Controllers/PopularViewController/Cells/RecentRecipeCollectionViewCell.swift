//
//  RecentRecipeCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class RecentRecipeCollectionViewCell: UICollectionViewCell {
    
    
    private let recipeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Theme.imageCornerRadius
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recipeLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let creatorImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let creatorLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
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
        addSubview(recipeImageView)
        addSubview(recipeLabel)
        addSubview(creatorImageView)
        addSubview(creatorLabel)
    }
    
    func configureCell(recipeImageName: String, recipeName: String, creatorImageName: String, creatorName: String) {
        recipeImageView.image = UIImage(named: recipeImageName)
        recipeLabel.text = recipeName
        creatorImageView.image = UIImage(named: creatorImageName)
        creatorLabel.text = "By \(creatorName)"
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeImageView.bottomAnchor.constraint(equalTo: recipeLabel.topAnchor, constant: -10),
            
            recipeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeLabel.heightAnchor.constraint(equalToConstant: 15),
            recipeLabel.bottomAnchor.constraint(equalTo: creatorImageView.topAnchor, constant: -10),
            
            creatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            creatorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            creatorImageView.heightAnchor.constraint(equalToConstant: 25),
            creatorImageView.widthAnchor.constraint(equalToConstant: 25),
            
            creatorLabel.leadingAnchor.constraint(equalTo: creatorImageView.trailingAnchor, constant: 10),
            creatorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            creatorLabel.centerYAnchor.constraint(equalTo: creatorImageView.centerYAnchor)
        ])
        
    }
}
