//
//  AddVocabularyView.swift
//  Gardener
//
//  Created by Stefan Cimander on 27.06.20.
//

import SwiftUI

struct AddVocabularyView: View {
    
    var onAdd: (Vocabulary) -> ()
    
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
            .navigationBarItems(leading: cancelButton, trailing: doneButton)
        }
    }
    
    private var cancelButton: some View {
        Button("Cancel") { dismiss() }
    }
    
    private var doneButton: some View {
        Button("Done") { addVocabulary(); dismiss() }
            .disabled(foreignName.isEmpty || nativeName.isEmpty)
            .font(.headline)
    }
    
    
    private func addVocabulary() {
        let vocabulary = Vocabulary(foreignName: foreignName, nativeName: nativeName)
        onAdd(vocabulary)
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}


// MARK: - Previews provider

struct AddVocabularyView_Previews: PreviewProvider {
    static var previews: some View {
        AddVocabularyView(onAdd: { _ in })
    }
}
