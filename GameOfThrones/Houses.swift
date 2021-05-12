//
//  Houses.swift
//  GameOfThrones
//
//  Created by Mesut Aygün on 11.05.2021.
//

import Foundation

class Houses {
    
   
    
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    
    var housesArray : [HouseInfo] = []
    
    var pageNumber = 1
    var continueLoading = true
    func getData(completed : @escaping () -> ()) {
        
        
        let urlString = "https://www.anapioficeandfire.com/api/houses?page=\(pageNumber)&pageSize=50"
        guard let url = URL(string: urlString) else {
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print("error\(error.localizedDescription)")
            }
            
            do{
                let results = try JSONDecoder().decode([HouseInfo].self, from: data!)
                if  results.count > 0  {
                    self.pageNumber += 1
                    self.housesArray = self.housesArray + results
                }
                else {
                    
                    self.continueLoading = false
                }
            }
                catch{
                    
                    print("error:\(error)")
                    
                }
                completed()
            }
        task.resume()
        }
        
    }
    
    
    
    
    

