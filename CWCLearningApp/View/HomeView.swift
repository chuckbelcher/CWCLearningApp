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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
