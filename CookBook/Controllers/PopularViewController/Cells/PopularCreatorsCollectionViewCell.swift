//
//  PopularCreatorsCollectionViewCell.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import UIKit

class PopularCreatorsCollectionViewCell: UICollectionViewCell {
    
    private let trendingImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trendingLabel: UILabel = {
       let label = UILabel()
        label.text = "Some text"
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
        backgroundColor = Theme.whiteColor
        layer.cornerRadius = 10

        addSubview(trendingImageView)
        addSubview(trendingLabel)
    }
    
    func configureCell(imageName: String, categoryName: String) {
        trendingImageView.image = UIImage(named: imageName)
        trendingLabel.text = categoryName
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            trendingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trendingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trendingImageView.bottomAnchor.constraint(equalTo: trendingLabel.topAnchor, constant: -10),
            
            trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trendingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            trendingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            trendingLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
    }
}
