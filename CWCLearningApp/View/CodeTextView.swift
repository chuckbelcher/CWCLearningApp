//
//  CodeTextView.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/29/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var contentModel: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
        
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        //Set attributed text for description
        textView.attributedText = contentModel.currentLessonDescription
        
        //Scroll Back to top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
            .environmentObject(ContentModel())
    }
}
