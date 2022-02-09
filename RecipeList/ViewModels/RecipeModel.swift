//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Parth Mathuria on 2/6/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        let service = DataService()
        self.recipes = service.getLocalData()
        
//        or do
//        self.recipes = DataService.getLocalData()
        
        
    }
    
}
