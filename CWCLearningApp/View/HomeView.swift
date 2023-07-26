//
//  ContentView.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 15)
                
                ScrollView {
                    LazyVStack  {
                        
                        ForEach(contentModel.modules) { module in
                            
                            VStack (spacing: 20) {
                                //Learning Card
                                NavigationLink {
                                    ContentView()
                                        .onAppear(perform: {
                                            contentModel.beginModule(module.id)
                                        })
                                } label: {
                                    HomeViewRow(image: module.content.image, category: " Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                        .multilineTextAlignment(.leading)
                                }
                                
                            
                            
                            
                            
                            //Test Card
                            HomeViewRow(image: module.test.image, category: "\(module.category) Assessment", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                            
                        }
                        
                    }
                    .padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("Get Started Now")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
