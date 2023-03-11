//
//  TrendingCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    var recipeID: Int?
    
    private lazy var favoriteButton: FavoriteButton = {
        let button = FavoriteButton(iconPointSize: 40)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = .zero
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let trendingImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = Theme.imageCornerRadius
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trendingLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let readyInMinutesLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
        addSubview(trendingImageView)
        addSubview(trendingLabel)
        addSubview(readyInMinutesLabel)
        addSubview(favoriteButton)
    }
    
    func configureCell(recipeImage: UIImage?, recipeName: String, readyInMinutes: Int, recipeID: Int) {
        if let image = recipeImage {
            spinner.removeFromSuperview()
            trendingImageView.image = image
            trendingImageView.layer.shadowColor = UIColor.black.cgColor
            trendingImageView.layer.shadowRadius = 3.0
            trendingImageView.layer.shadowOpacity = 1.0
            trendingImageView.layer.shadowOffset = CGSize(width: 0, height: 15)
        } else {
            addSubview(spinner)
            spinner.makeSpinner(trendingImageView)
        }
        trendingLabel.text = recipeName
        readyInMinutesLabel.text = "Time: \(readyInMinutes) minute"
        self.recipeID = recipeID
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            
            trendingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trendingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trendingImageView.bottomAnchor.constraint(equalTo: readyInMinutesLabel.topAnchor, constant: -10),
            
            readyInMinutesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            readyInMinutesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            readyInMinutesLabel.heightAnchor.constraint(equalToConstant: 15),
            readyInMinutesLabel.bottomAnchor.constraint(equalTo: trendingLabel.topAnchor, constant: -10),
            
            trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            trendingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            trendingLabel.heightAnchor.constraint(equalToConstant: 15),
            trendingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ])
    }
}

extension TrendingCollectionViewCell {
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
