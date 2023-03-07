//
//  PopularCategoryCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class PopularCategoryCollectionViewCell: UICollectionViewCell {
    
    private let view: UIView = {
      let view = UIView()
        view.backgroundColor = Theme.yellowColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backImageView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let popularCategoryImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Theme.imageCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let popularCategoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let byLabel: UILabel = {
       let label = UILabel()
        label.text = "by"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let creatorLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
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
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        view.addSubview(popularCategoryLabel)
        view.addSubview(byLabel)
        view.addSubview(creatorLabel)
        addSubview(backImageView)
        backImageView.addSubview(popularCategoryImageView)
    }
    
    func configureCell(imageName: String, categoryName: String, creatorName: String) {
        popularCategoryImageView.image = UIImage(named: imageName)
        popularCategoryLabel.text = categoryName
        creatorLabel.text = creatorName
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            backImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backImageView.widthAnchor.constraint(equalToConstant: 100),
            backImageView.heightAnchor.constraint(equalToConstant: 100),
            
            popularCategoryImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 0),
            popularCategoryImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 0),
            popularCategoryImageView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 0),
            popularCategoryImageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0),
            
            popularCategoryLabel.topAnchor.constraint(equalTo: popularCategoryImageView.bottomAnchor, constant: 10),
            popularCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            popularCategoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            popularCategoryLabel.bottomAnchor.constraint(equalTo: byLabel.topAnchor, constant: -5),
            
            byLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            byLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            byLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            byLabel.bottomAnchor.constraint(equalTo: creatorLabel.topAnchor, constant: -5),
            
            creatorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            creatorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            creatorLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
