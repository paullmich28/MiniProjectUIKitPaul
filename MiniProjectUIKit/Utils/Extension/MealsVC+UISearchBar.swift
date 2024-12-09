//
//  MealsVC+UISearchBar.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 09/12/24.
//

import UIKit

extension MealsViewController: UISearchBarDelegate {
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
         // Empty searchText: Show default message
         self.meals = []
         self.collectionView?.isHidden = true
         self.defaultLabel.text = variables.defaultString
         self.defaultLabel.isHidden = false
      } else {
         // Perform API search
         api.fetchData(search: searchText) { result in
            // Display results
            self.meals = result
            
            self.collectionView?.isHidden = false
            self.defaultLabel.isHidden = true
            self.collectionView?.reloadData()
         }
      }
   }
}
