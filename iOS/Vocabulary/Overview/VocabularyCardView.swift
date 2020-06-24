//
//  VocabularyCardView.swift
//  iOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI

struct VocabularyCardView: View {
    
    var vocabulary: Vocabulary
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image("Placeholder")
                .resizable()
                .frame(width: 32, height: 32)
                
            
            VStack(alignment: .leading) {
                Text(vocabulary.foreignName).font(.headline)
                Text(vocabulary.nativeName).font(.body).fontWeight(.light)
            }
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(10.0)
    }
}

struct VocabularyCardView_Previews: PreviewProvider {
    static var previews: some View {
        let vocabulary = Vocabulary(nativeName: "der Wald", foreignName: "el bosque")
        return VocabularyCardView(vocabulary: vocabulary)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}

