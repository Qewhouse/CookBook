//
//  OnboardingViewController.swift
//  CookBook
//
//  Created by Alexander Altman on 27.02.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    let backView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "screen")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("TEST", for: .normal)
        button.layer.cornerRadius = Theme.buttonCornerRadius
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backView)
        view.addSubview(button)
    }
    
    @objc func buttonTapped () {
        print("test")
    }
    
}

extension OnboardingViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        
        ])
    }
}


import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 12 Pro Max")
            .previewDisplayName("iPhone 12 Pro Max")
        
        ContainterView().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone SE (3rd generation)")
            .previewDisplayName("iPhone SE (3rd generation)")
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        let listVC = OnboardingViewController()
        func makeUIViewController(context:
                                  UIViewControllerRepresentableContext<ListProvider.ContainterView>) -> OnboardingViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController:
                                    ListProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<ListProvider.ContainterView>) {
        }
    }
}
