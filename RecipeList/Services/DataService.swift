//
//  DataService.swift
//  RecipeList
//
//  Created by Parth Mathuria on 2/6/22.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!) // ! unwraps it
        
        // Create a data object
        do {
            let data = try Data(contentsOf: url)
            
            // Decode the data with JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
            
        }
        catch {
            print(error)
        }
        
        return [Recipe]()

    }
    
}
