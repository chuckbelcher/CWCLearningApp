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
                    
                    ForEach(0..<contentModel.currentModule!.content.lessons.count, id: \.self) {index in
                        //Display Lesson Card
                        ContentViewRow(index: index)
                        
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(contentModel.currentModule?.category ?? "")")
            
        }
        
    }
}
