//
//  FavoriteManager.swift
//  CookBook
//
//  Created by Sergey on 11.03.2023.
//

import Foundation


protocol FavoriteManagerProtocol: AnyObject {
    func addToFavorite(recipeID: Int, recipeImage: Data?, completionBlock: @escaping (Result<Bool, Error>) -> Void)
    func deleteFromFavorite(recipeID: Int , completionBlock: @escaping (Result<Bool, Error>) -> Void)
    func getFromFavorite(recipeID: Int, completionBlock: @escaping (Result<RecipeModel, Error>) -> Void)
    func getAllRecipeFromFavorite(completionBlock: @escaping (Result<RecipeModel?, Error>) -> Void)
    func checkForFavorite(recipeID: Int) -> Bool
}

class FavoriteManager: FavoriteManagerProtocol {
    
    var defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let networkManager = NetworkManager()
    
    //MARK: - Add to favorite method
    
    func addToFavorite(recipeID: Int, recipeImage: Data?, completionBlock: @escaping (Result<Bool, Error>) -> Void) {
        
        var recipeData: Data?
        if checkForFavorite(recipeID: recipeID) == true {
            completionBlock(.failure(FavoriteError.favoriteExist))
        } else {
            
            networkManager.fetchRecipeByID(.searchByID(recipeID: recipeID)) { [weak self]result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    recipeData = data
                    var favoriteIDList = self.defaults.object(forKey: "favoriteList") as? [Int] ?? [Int]()
                    print(favoriteIDList)
                    favoriteIDList.append(recipeID)
                    self.defaults.set(favoriteIDList, forKey: "favoriteList")
                    completionBlock(.success(true))
                case .failure(let error):
                    completionBlock(.failure(error))
                }
            }
            

            
            
            
            
            
        }
    }
    
    //MARK: - Deleting from favorite method
    
    func deleteFromFavorite(recipeID: Int, completionBlock: @escaping (Result<Bool, Error>) -> Void) {
        
        if checkForFavorite(recipeID: recipeID) == false {
            completionBlock(.failure(FavoriteError.notInFavorite))
            return
        }
        
        //Здесь метод удаления записи из БД и в случаи успешного удаления из БД удаляем из UserDefaults кодом ниже
        
        var favoriteIDList = defaults.object(forKey: "favoriteList") as? [Int] ?? [Int]()
        
        if let index = favoriteIDList.firstIndex(of: recipeID) {
            favoriteIDList.remove(at: index)
            defaults.set(favoriteIDList, forKey: "favoriteList")
            completionBlock(.success(true))
            
        }
        
        
    }
    
    //MARK: - Getting from favorite method
    
    func getFromFavorite(recipeID: Int, completionBlock: @escaping (Result<RecipeModel, Error>) -> Void) {
        
        if checkForFavorite(recipeID: recipeID) == false {
            completionBlock(.failure(FavoriteError.notInFavorite))
            return
        }
        
        var recipeEncoded: Data?
        // Записываем в переменную recipeEncoded данные из БД по данному рецепту
        
        
        
        //и возвращаем их в completionBlock после декодирования
        if let recipesData = recipeEncoded {
            do {
                let recipes = try JSONDecoder().decode(RecipeModel.self, from: recipesData)
                completionBlock(.success(recipes))
            } catch let error {
                completionBlock(.failure(error))
            }
        }
        
    }
    
    //MARK: - Getting all recipe from favorite
    
    func getAllRecipeFromFavorite(completionBlock: @escaping (Result<RecipeModel?, Error>) -> Void) {
        var recipesData: Data?
        
        // метод получения массива рецептов из БД
        
        
        // Декодируем и возвращаем массив
       
        if let recipesData = recipesData {
            do {
                let recipes = try JSONDecoder().decode(RecipeModel.self, from: recipesData)
                completionBlock(.success(recipes))
            } catch let error {
                completionBlock(.failure(error))
            }
        }
    }
    
    //MARK: - Checking is favorite exist
    
    func checkForFavorite(recipeID: Int) -> Bool {
        let favoriteIDList = defaults.object(forKey: "favoriteList") as? [Int] ?? [Int]()
        if favoriteIDList.contains(where: {$0 == recipeID}) {
           return true
        } else {
          return false
        }
    }
    
    //

}
