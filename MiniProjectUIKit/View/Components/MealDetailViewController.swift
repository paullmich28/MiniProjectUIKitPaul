//
//  MealDetailViewController.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 04/12/24.
//

import UIKit

class MealDetailViewController: UIViewController {
   var meal: Meal?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      setupUI()
   }
   
   private func setupUI() {
      guard let meal = meal else { return }
      
      let mealNameLabel = UILabel()
      mealNameLabel.text = meal.strMeal
      mealNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
      mealNameLabel.textAlignment = .center
      mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(mealNameLabel)
      
      let mealInstructionsLabel = UILabel()
      mealInstructionsLabel.text = meal.strInstructions
      mealInstructionsLabel.font = .systemFont(ofSize: 16)
      mealInstructionsLabel.numberOfLines = 0
      mealInstructionsLabel.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(mealInstructionsLabel)
      
      NSLayoutConstraint.activate([
         mealNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
         mealNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         mealNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
         
         mealInstructionsLabel.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 16),
         mealInstructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
         mealInstructionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
      ])
   }
}
