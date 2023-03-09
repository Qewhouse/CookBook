//
//  TrendingCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    private let trendingImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.contentScaleFactor = 1.0
        imageView.layer.cornerRadius = Theme.imageCornerRadius
        imageView.layer.masksToBounds = true
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
    
//    private let creatorImageView: UIImageView = {
//       let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    private let creatorLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14)
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
        addSubview(trendingImageView)
        addSubview(trendingLabel)
//        addSubview(creatorImageView)
        addSubview(creatorLabel)
    }
    
    func configureCell(recipeImageName: UIImage?, recipeName: String, creatorName: String) {
        if let image = recipeImageName {
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

//        trendingImageView.image = UIImage(named: recipeImageName)
        trendingLabel.text = recipeName
//        creatorImageView.image = UIImage(named: creatorImageName)
        creatorLabel.text = "By \(creatorName)"
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            trendingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trendingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trendingImageView.bottomAnchor.constraint(equalTo: trendingLabel.topAnchor, constant: -10),
            
            trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trendingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trendingLabel.heightAnchor.constraint(equalToConstant: 15),
            trendingLabel.bottomAnchor.constraint(equalTo: creatorLabel.topAnchor, constant: -10),
            
//            creatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            creatorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
//            creatorImageView.heightAnchor.constraint(equalToConstant: 40),
//            creatorImageView.widthAnchor.constraint(equalToConstant: 40),
            
            creatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            creatorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            creatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
