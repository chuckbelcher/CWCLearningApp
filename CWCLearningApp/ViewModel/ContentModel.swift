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
    @Published var currentLesson: Lesson?
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    
    
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
    
    func beginLesson(_ lessonIndex: Int) {
        
        if lessonIndex < currentModule!.content.lessons.count {
            
            currentLessonIndex = lessonIndex
            
        } else {
            
            currentLessonIndex = 0
            
        }
        
        //Set current Lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex  < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
   
    }
    
}
