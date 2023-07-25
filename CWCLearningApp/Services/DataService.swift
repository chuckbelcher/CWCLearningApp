//
//  DataServoce.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/24/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Module] {
        
        //Get a URL to teh json file
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        guard url != nil else {
            return [Module]()
        }
        do {
            //Read the file into a data object
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            
            do {
                //Decode the data object and return the contenets
                let moduleData = try decoder.decode([Module].self, from: data)
                return moduleData
                
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        return [Module]()
        
        
    }
    
    static func getLocalStyleData() -> Data {
        
        //Get a URL to teh json file
        let url = Bundle.main.url(forResource: "style", withExtension: "html")
        guard url != nil else {
            return Data()
        }
        do {
            //Read the file into a data object
            let data = try Data(contentsOf: url!)
            return data
            
        } catch {
            print(error)
        }
        return Data()
        
        
    }
    
    
}
