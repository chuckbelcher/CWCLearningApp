//
//  ContentView.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                if contentModel.currentModule != nil {
                    
                    ForEach(contentModel.currentModule!.content.lessons) {lesson in
                        //Display Lesson Card
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 66)
                            
                            HStack {
                                Text("\(lesson.id)")
                                    .font(.title)
                                
                                Spacer()
                                
                                VStack (alignment: .leading){
                                    
                                    Text(lesson.title)
                                        .font(.title)
                                    Text(lesson.duration)
                                }
                            }
                            .padding()
                            
                        }
                        
                    }
                }
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environmentObject(ContentModel())
            
    }
}
