//
//  PopularViewController.swift
//  CookBook
//
//  Created by Alexander Altman on 26.02.2023.
//

import UIKit

class PopularViewController: UIViewController {
    
    var networkManager = NetworkManager()
    var randomRecipes: [Recipe]?
    var mealRecipes: [Recipe]?
    var hourRecipe: [Recipe]?
    let buttonsName = MealType.mealArray
    
    // Collection view / Compositional Layout
//    private let topScreenLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Get amazing recipes for cooking"
//        label.adjustsFontSizeToFitWidth = true
//        label.font = UIFont.boldSystemFont(ofSize: 30)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private let collectionView: UICollectionView = {
       let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
//        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let sections = MockData.shared.pageData

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = MealTime.getMealTime()[0]
        
        fetchRandomData()
        fetchDataByTime()
        fetchDataByMeal("dinner")
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    
    private func setupViews() {
//        view.backgroundColor = Theme.whiteColor
//        view.addSubview(topScreenLabel)
        
        view.addSubview(collectionView)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: "TrendingCollectionViewCell")
        collectionView.register(PopularCategoryButtonCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCategoryButtonCollectionViewCell")
        collectionView.register(PopularCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCategoryCollectionViewCell")
        collectionView.register(RecentRecipeCollectionViewCell.self, forCellWithReuseIdentifier: "RecentRecipeCollectionViewCell")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - Create Layout

extension PopularViewController {
// Метод получения рецептов по тегам - meal, количество получаемых рецептов - number
    
    func fetchDataByTime() {
        let time = MealTime.getMealTime()[1]
        networkManager.fetchRecipes(.randomSearch(number: 10, tags: [time])) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let recipes = data.recipes {
                        self.hourRecipe = recipes
                    }
                case .failure(let error):
                    self.showErrorAlert(error: error)
                }
            }
        }
    }
    
    func fetchDataByMeal(_ meal: String) {
        networkManager.fetchRecipes(.randomSearch(number: 10, tags: [meal])) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let recipes = data.recipes {
                        // сюда приходит массив рецептов
                        self.mealRecipes = recipes
//                        self.collectionView.reloadData()
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    
                    self.showErrorAlert(error: error)
                    
                }
            }
        }
    }
    
// Метод получения случайных рецептов. Количество - number
    func fetchRandomData() {
        networkManager.fetchRecipes(.randomSearch(number: 10)) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let recipes = data.recipes {
                        // сюда приходит массив случайных рецептов
                        self.randomRecipes = recipes
                        
                    }
                case .failure(let error):
                    self.showErrorAlert(error: error)
                }
            }
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]

            switch section {
            case .trendingNow(_):
                return self.createTrendingNowSection()
            case .popularCategory(_):
                return self.createPopularCategorySection()
            case .recentRecipe(_):
                return self.createRecentRecipeSection()
            case .popularCategoryButton(_):
                return self.createPopularCategoryButtonSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createTrendingNowSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.5)),
                                                       subitems: [item])

        let section = createLayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 20,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
        return section
    }
    
    private func createPopularCategoryButtonSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.2),
                                                                         heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
        return section
    }
    
    private func createPopularCategorySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.35)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 20,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
        return section
    }
    
    private func createRecentRecipeSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 20,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 10)
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate

extension PopularViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource

extension PopularViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section] {

        case .trendingNow(_):
            return
        case .popularCategoryButton(_):
            if let cell = collectionView.cellForItem(at: indexPath) as? PopularCategoryButtonCollectionViewCell {
                let meal = cell.button.titleLabel?.text
                if let meal = meal {
                    fetchDataByMeal(meal)
                    
                }
            }
        case .popularCategory(_):
            return
        case .recentRecipe(_):
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .trendingNow(let now):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath) as? TrendingCollectionViewCell else { return UICollectionViewCell() }
            if let hourRecipe = hourRecipe {
                //Метод получения картинки по сведениям из модели
                if let imageName = hourRecipe[indexPath.row].image {
                    networkManager.fetchImage(for: .recipe, with: imageName.changeImageSize(to: ImageSizes.big), size: ImageSizes.big.rawValue) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let data):
                                cell.configureCell(recipeImage: UIImage(data: data),
                                                   recipeName: hourRecipe[indexPath.row].title,
                                                   creatorImageName: now[indexPath.row].photoCreator,
                                                   creatorName: hourRecipe[indexPath.row].sourceName ?? "",
                                                   recipeID: hourRecipe[indexPath.row].id)
                            case .failure(let error):
                                self.showErrorAlert(error: error)
                            }
                        }
                    }
                }
                cell.configureCell(recipeImage: nil,
                                   recipeName: hourRecipe[indexPath.row].title,
                                   creatorImageName: now[indexPath.row].photoCreator,
                                   creatorName: hourRecipe[indexPath.row].sourceName ?? "",
                                   recipeID: hourRecipe[indexPath.row].id)
                
            } else {
                cell.configureCell(recipeImage: nil,
                                   recipeName: now[indexPath.row].title,
                                   creatorImageName: now[indexPath.row].photoCreator,
                                   creatorName: now[indexPath.row].creatorName,
                                   recipeID: 0)
            }
            
            return cell
        case .popularCategoryButton(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCategoryButtonCollectionViewCell", for: indexPath) as? PopularCategoryButtonCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(buttonName: buttonsName[indexPath.row])
            cell.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.2)
                       cell.layer.cornerRadius = 25
                       cell.layer.shadowRadius = 3.0
                       cell.layer.shadowOpacity = 1.0
                       cell.layer.shadowOffset = CGSize(width: 0, height: 10)
            return cell
        case .popularCategory(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCategoryCollectionViewCell", for: indexPath) as? PopularCategoryCollectionViewCell else { return UICollectionViewCell() }
            if let mealRecipes = mealRecipes {
                if let image = mealRecipes[indexPath.row].image {
                    networkManager.fetchImage(for: .recipe, with: image.changeImageSize(to: .big), size: ImageSizes.big.rawValue) { result in
                        DispatchQueue.main.async {
                            switch result {
                                
                            case .success(let data):
                                cell.configureCell(image: UIImage(data: data),
                                                   recipeName: mealRecipes[indexPath.row].title,
                                                   creatorName: mealRecipes[indexPath.row].sourceName ?? "",
                                                   recipeID: mealRecipes[indexPath.row].id)
                            case .failure(let error):
                                self.showErrorAlert(error: error)
                            }
                        }
                    }
                } else {
                    cell.configureCell(image: nil,
                                       recipeName: mealRecipes[indexPath.row].title,
                                       creatorName: mealRecipes[indexPath.row].sourceName ?? "",
                                       recipeID: mealRecipes[indexPath.row].id)
                }
            } else {
                
                cell.configureCell(image: nil,
                                   recipeName:  category[indexPath.row].title,
                                   creatorName: category[indexPath.row].creatorName,
                                   recipeID: 0)
            }
            return cell
        case .recentRecipe(let recipe):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentRecipeCollectionViewCell", for: indexPath) as? RecentRecipeCollectionViewCell else { return UICollectionViewCell() }
            if let randomRecipes = randomRecipes {
                //Метод получения картинки по сведениям из модели
                if let imageName = randomRecipes[indexPath.row].image {
                    networkManager.fetchImage(for: .recipe, with: imageName.changeImageSize(to: ImageSizes.big), size: ImageSizes.big.rawValue) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let data):
                                cell.configureCell(recipeImage: UIImage(data: data),
                                                   recipeName: randomRecipes[indexPath.row].title,
                                                   creatorImageName: recipe[indexPath.row].photoCreator,
                                                   creatorName: randomRecipes[indexPath.row].sourceName ?? "",
                                                   recipeID: randomRecipes[indexPath.row].id)
                            case .failure(let error):
                                self.showErrorAlert(error: error)
                            }
                        }
                    }
                }
                cell.configureCell(recipeImage: nil,
                                   recipeName: randomRecipes[indexPath.row].title,
                                   creatorImageName: recipe[indexPath.row].photoCreator,
                                   creatorName: randomRecipes[indexPath.row].sourceName ?? "",
                                   recipeID: randomRecipes[indexPath.row].id)
                
            } else {
                cell.configureCell(recipeImage: nil,
                                   recipeName: recipe[indexPath.row].title,
                                   creatorImageName: recipe[indexPath.row].photoCreator,
                                   creatorName: recipe[indexPath.row].creatorName,
                                   recipeID: 0)
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "HeaderSupplementaryView",
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension PopularViewController {
    func showErrorAlert(error: Error) {
        
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
            return
        }
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
}


//MARK: - Set Constraints

extension PopularViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
//            topScreenLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            topScreenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            topScreenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
