//
//  VocabularyCardView.swift
//  iOS
//
//  Created by Stefan Cimander on 24.06.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct VocabularyCardView: View {
    
    var vocabulary: Vocabulary
    
    var body: some View {
        HStack(spacing: 12) {
            
            WebImage(url: vocabulary.imageUrl)
                .resizable()
                .placeholder(Image("Placeholder"))
                .frame(width: 32, height: 32)
                
            VStack(alignment: .leading) {
                Text(vocabulary.foreignName).font(.headline)
                Text(vocabulary.nativeName).font(.body).fontWeight(.light)
            }
            Spacer()
            
            VocabularyLevelIndicator(level: vocabulary.level)
        }
        .padding()
        .padding([.trailing])
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(10.0)
    }
    
}


// MARK: - Previews provider

struct VocabularyCardView_Previews: PreviewProvider {
    static var previews: some View {
        let vocabulary = Vocabulary(foreignName: "el bosque", nativeName: "der Wald")
        return VocabularyCardView(vocabulary: vocabulary)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}

