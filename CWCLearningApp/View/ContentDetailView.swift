//
//  ContentDetailView.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/28/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var contentModel: ContentModel

    var body: some View {
        
        let lesson = contentModel.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        
        VStack {
            if  url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            //TODO: Description
            
            
            
            if contentModel.hasNextLesson() {
                
                ZStack {
                    
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Button {
                        print("Buttong for next lesson pressed")
                        contentModel.nextLesson()
                    } label: {
                        Text("Next Lesson: " + contentModel.currentModule!.content.lessons[contentModel.currentLessonIndex + 1].title)
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
            }

            
        }
        .padding()
        
    }
}
