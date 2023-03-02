//
//  MockData.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let trendingNow: ListSection = {
        .trendingNow([.init(title: "image1", image: "image1"),
                      .init(title: "image2", image: "image2"),
                      .init(title: "image3", image: "image3"),
                      .init(title: "image4", image: "image4")])
    }()
    
    private let popularCategory: ListSection = {
        .popularCategory([.init(title: "image9", image: "image1"),
                          .init(title: "image10", image: "image2"),
                          .init(title: "image11", image: "image3"),
                          .init(title: "image12", image: "image4")])
        
    }()
    
    private let recentRecipe: ListSection = {
        .recentRecipe([.init(title: "image9", image: "image1"),
                       .init(title: "image10", image: "image2"),
                       .init(title: "image11", image: "image3"),
                       .init(title: "image12", image: "image4")])
       
    }()
    
    private let popularCreators: ListSection = {
        .popularCreators([.init(title: "image13", image: "Avatar1"),
                          .init(title: "image14", image: "Avatar2"),
                          .init(title: "image15", image: "Avatar3"),
                          .init(title: "image16", image: "Avatar1")])
    }()
    
    var pageData: [ListSection] {
        [trendingNow, popularCategory, recentRecipe, popularCreators]
    }
}
