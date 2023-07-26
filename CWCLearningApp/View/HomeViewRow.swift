//
//  HomeViewRow.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/25/23.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var category: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175 ), contentMode: .fit)
            
            
            HStack {
                
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                //Text
                VStack (alignment: .leading, spacing: 10) {
                    //Headline
                    Text(category)
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom)
                        .font(Font.system(size: 12))
                    
                    //Icons
                    HStack {
                        //Number of Lessons/Questions
                        Image(systemName: "book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        //Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                    
                }
                .padding(.leading, 20)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        let contentModel = ContentModel()
        HomeViewRow(image: contentModel.modules[0].content.image, category: contentModel.modules[0].category, description: contentModel.modules[0].content.description, count: "15 Lessons", time: contentModel.modules[0].content.time)
            
    }
}
