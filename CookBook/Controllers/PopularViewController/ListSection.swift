//
//  ListSection.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import Foundation


enum ListSection {
    case trendingNow([ListItem])
    case popularCategory([ListItem])
    case recentRecipe([ListItem])
    case popularCreators([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .trendingNow(let items),
                .popularCategory(let items),
                .recentRecipe(let items),
                .popularCreators(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .trendingNow(_):
            return "Trending Now"
        case .popularCategory(_):
            return "Popular Category"
        case .recentRecipe(_):
            return "Recent Recipe"
        case .popularCreators(_):
            return "Popular Creators"
        }
    }
    
    
}
