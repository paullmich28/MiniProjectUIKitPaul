//
//  MealsVC+UICollectionView.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 08/12/24.
//

import UIKit

extension MealsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return meals.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MealCollectionViewCell else {
         return UICollectionViewCell()
      }
      
      cell.configure(with: meals[indexPath.row])
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let selectedMeal = meals[indexPath.row]
      
      let detailVC = MealDetailViewController()
      detailVC.meal = selectedMeal // Pass the selected meal to the detail view controller
      
      navigationController?.pushViewController(detailVC, animated: true)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemWidth = (collectionView.bounds.width - 30) / 2 // Two columns with spacing
      let imageHeight = itemWidth // Square image
      
      let meal = meals[indexPath.row]
      
      // Estimate title and area height
      let titleHeight = meal.strMeal.height(forWidth: itemWidth - 10, font: UIFont.systemFont(ofSize: 14, weight: .bold))
      let areaHeight = meal.strArea.height(forWidth: itemWidth - 10, font: UIFont.systemFont(ofSize: 12, weight: .regular))
      
      let totalHeight = imageHeight + titleHeight + areaHeight + 20 // 20 for padding
      return CGSize(width: itemWidth, height: totalHeight)
   }
}
