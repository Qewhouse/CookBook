//
//  RecentRecipeCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class RecentRecipeCollectionViewCell: UICollectionViewCell {
    
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    var recipeID: Int?
    
    private let recipeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.contentScaleFactor = 1.0
        imageView.layer.cornerRadius = Theme.imageCornerRadius
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recipeLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var favoriteButton: FavoriteButton = {
        let button = FavoriteButton()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = .zero
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        favoriteButton.addTarget(self, action: #selector(tappedFavoriteButton), for: .touchUpInside)
        addSubview(recipeImageView)
        addSubview(recipeLabel)
        addSubview(creatorImageView)
        addSubview(creatorLabel)
        addSubview(favoriteButton)
    }
    
    func configureCell(recipeImage: UIImage?, recipeName: String, creatorImageName: String, creatorName: String, recipeID: Int) {
        if let image = recipeImage {
            spinner.removeFromSuperview()
            recipeImageView.image = image
            recipeImageView.layer.shadowColor = UIColor.black.cgColor
            recipeImageView.layer.shadowRadius = 3.0
            recipeImageView.layer.shadowOpacity = 1.0
            recipeImageView.layer.shadowOffset = CGSize(width: 0, height: 15)
        } else {
            addSubview(spinner)
            spinner.makeSpinner(recipeImageView)
        }
        recipeLabel.text = recipeName
        creatorImageView.image = UIImage(named: creatorImageName)
        creatorLabel.text = "By \(creatorName)"
        self.recipeID = recipeID
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            
            recipeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeImageView.bottomAnchor.constraint(equalTo: recipeLabel.topAnchor, constant: -10),
            
            recipeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeLabel.heightAnchor.constraint(equalToConstant: 40),
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

extension RecentRecipeCollectionViewCell {
    @objc func tappedFavoriteButton(_ button: FavoriteButton) {
        if let recipeID = recipeID {
            if button.isFavorite == false {
                button.setActive()
                print("Recipe ID is: \(recipeID)")
            } else {
                button.setInactive()
            }
        }
    }
}
