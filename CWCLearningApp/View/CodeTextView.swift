//
//  CodeTextView.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/29/23.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
        
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        //Add update code here
        
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
