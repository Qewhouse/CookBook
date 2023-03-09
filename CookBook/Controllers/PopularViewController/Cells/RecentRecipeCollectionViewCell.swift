//
//  RecentRecipeCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class RecentRecipeCollectionViewCell: UICollectionViewCell {
    
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    
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
    
    func configureCell(recipeImage: UIImage?, recipeName: String, creatorName: String) {
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
    //    recipeImageView.image = UIImage(named: recipeImageName)
        recipeLabel.text = recipeName
//        creatorImageView.image = UIImage(named: creatorImageName)
        creatorLabel.text = "By \(creatorName)"
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            recipeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeImageView.heightAnchor.constraint(equalTo: widthAnchor.self),
            recipeImageView.bottomAnchor.constraint(equalTo: recipeLabel.topAnchor, constant: -10),
            
            recipeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            recipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            recipeLabel.heightAnchor.constraint(equalToConstant: 40),
            recipeLabel.bottomAnchor.constraint(equalTo: creatorLabel.topAnchor, constant: -10),
            
//            creatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            creatorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
//            creatorImageView.heightAnchor.constraint(equalToConstant: 25),
//            creatorImageView.widthAnchor.constraint(equalToConstant: 25),
            
            creatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            creatorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            creatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
