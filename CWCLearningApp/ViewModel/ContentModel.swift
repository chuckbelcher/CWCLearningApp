//
//  ContentModel.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/24/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules:[Module]
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    
    var styleData: Data?
    
    init() {
        self.modules = DataService.getLocalData()
        self.styleData = DataService.getLocalStyleData()
    }
    
    
    func beginModule(_ moduleid: Int) {
        
        //Find module id index
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
                currentModuleIndex = index
                break
            }
        }
        
        //Set current module
        currentModule = modules[currentModuleIndex]
    }
    
}
