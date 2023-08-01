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
    @Published var currentLessonDescription = NSAttributedString()
    @Published var currentContentSelected: Int?
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
        currentLessonDescription = createAttributedDescription(currentLesson!.explanation)
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex  < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            currentLessonDescription = createAttributedDescription(currentLesson!.explanation)
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
   
    }
    
    func resetCurrentContentSelected() {
        return currentContentSelected = nil
    }
    
    private func createAttributedDescription(_ htmlString: String) -> NSAttributedString {
        
        var descriptionAttributedString = NSAttributedString()
        var data = Data()
        
        //Add styling
        if styleData != nil {
            data.append(styleData!)
        }
        
        data.append(Data(htmlString.utf8))
        
        //Convert to attribyted string
        do {
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            
            descriptionAttributedString = attributedString
            
        } catch {
            print("Can't trurn html into attributed string")
        }
        
        return descriptionAttributedString
        
    }
    
    
}
