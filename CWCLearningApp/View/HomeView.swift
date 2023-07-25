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
            Text(contentModel.modules[0].category)
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
