//
//  ListSection.swift
//  CookBook
//
//  Created by Михаил Позялов on 28.02.2023.
//

import Foundation


enum ListSection {
    case trendingNow([ListItem])
    case popularCategoryButton([ListItem])
    case popularCategory([ListItem])
    case recentRecipe([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .trendingNow(let items),
                .popularCategoryButton(let items),
                .popularCategory(let items),
                .recentRecipe(let items):
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
        case .popularCategoryButton(_):
            return "Popular Category"
        case .popularCategory(_):
            return ""
        case .recentRecipe(_):
            return "Recent Recipe"
        }
    }
}
