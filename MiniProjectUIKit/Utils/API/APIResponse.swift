//
//  APIResponse.swift
//  MiniProjectUIKit
//
//  Created by Paulus Michael on 09/12/24.
//

import Foundation

struct APIResponse {
   public func fetchData(search: String, completion: @escaping ([Meal]) -> Void) {
      let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(search)" // Replace with your API URL
      guard let url = URL(string: urlString) else { return }
      
      URLSession.shared.dataTask(with: url) { data, response, error in
         guard error == nil, let data = data else {
            print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
            return
         }
         
         do {
            let result = try JSONDecoder().decode(MealResponse.self, from: data)
            DispatchQueue.main.async {
               completion(result.meals)
            }
         } catch {
            print("Failed to decode JSON: \(error)")
         }
      }.resume()
   }
}
