//
//  AddVocabularyView.swift
//  iOS
//
//  Created by Stefan Cimander on 27.06.20.
//

import SwiftUI

struct AddVocabularyView: View {
    
    @State private var foreignName = ""
    @State private var nativeName = ""
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Spanish", text: $foreignName)
                    TextField("German", text: $nativeName)
                }
                .padding(.vertical, 8)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            }
            .navigationBarTitle("Add Word", displayMode: .inline)
            .navigationBarItems(leading: cancelButton)
        }
    }
    
    private var cancelButton: some View {
        Button("Cancel") { self.dismiss() }
    }
    
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}


// MARK: - Previews

struct AddVocabularyView_Previews: PreviewProvider {
    static var previews: some View {
        AddVocabularyView()
    }
}
