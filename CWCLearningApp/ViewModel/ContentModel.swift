//
//  ContentModel.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/24/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules:[Module]
    var styleData: Data?
    
    init() {
        self.modules = DataService.getLocalData()
        self.styleData = DataService.getLocalStyleData()
    }
}
