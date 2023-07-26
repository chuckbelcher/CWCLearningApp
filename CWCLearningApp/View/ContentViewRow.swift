//
//  ContentViewRow.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/25/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var contentModel: ContentModel
    var index: Int
    
    var body: some View {
        
        
        let lesson = contentModel.currentModule!.content.lessons[index]
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                Text("\(lesson.id + 1)")
                    .font(.title)
                
                VStack (alignment: .leading, spacing: 3){
                    
                    Text(lesson.title)
                        .font(Font.system(size: 16))
                        .bold()
                    Text("Time: \(lesson.duration)")
                        .font(Font.system(size: 14))
                }
            }
            .padding()
            
        }
    }
}

