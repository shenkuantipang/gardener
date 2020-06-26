//
//  VocabularyLevelIndicator.swift
//  Gardener
//
//  Created by Stefan Cimander on 26.06.20.
//

import SwiftUI

struct VocabularyLevelIndicator: View {
    
    var level: Int
    
    var body: some View {
        
        let levelCircle = Circle()
            .fill(Color.accentColor)
            .frame(width: 24, height: 24)
        
        return Text(level.description)
            .foregroundColor(.white)
            .background(levelCircle)
    }
}


// MARK: - Previews

struct VocabularyLevelIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyLevelIndicator(level: 2)
            .previewLayout(.fixed(width: 40, height: 40))
    }
}
