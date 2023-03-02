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
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backImageView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let trendingImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trendingLabel: UILabel = {
       let label = UILabel()
        label.text = "Some text"
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
        layer.cornerRadius = 10

        addSubview(view)
        view.addSubview(trendingLabel)
        addSubview(backImageView)
        backImageView.addSubview(trendingImageView)
        backImageView.layer.cornerRadius = bounds.size.width / 2
    }
    
    func configureCell(imageName: String, categoryName: String) {
        trendingImageView.image = UIImage(named: imageName)
        trendingLabel.text = categoryName
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            trendingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            trendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            trendingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            trendingLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            backImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backImageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backImageView.widthAnchor.constraint(equalToConstant: 70),
            backImageView.heightAnchor.constraint(equalToConstant: 70),
            
            trendingImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 0),
            trendingImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 0),
            trendingImageView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 0),
            trendingImageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 0)
            
            
            
//            trendingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            trendingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            trendingImageView.bottomAnchor.constraint(equalTo: trendingLabel.topAnchor, constant: -10),
//
//            trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            trendingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            trendingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            trendingLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
    }
}
