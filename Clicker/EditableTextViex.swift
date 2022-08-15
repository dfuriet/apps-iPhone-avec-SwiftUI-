//
//  EditableTextViex.swift
//  Clicker
//
//  Created by Damien FURIET on 15/08/2022.
//

import SwiftUI

struct EditableTextView: View {
    let title:String
    @State private var isEditing = false
    @Binding var editedText:String
    var body: some View {
        HStack {
            if isEditing == true {
                TextField(title, text: $editedText)
                    .padding()
            } else {
                Text(editedText)
                    .padding()
            }
            Image(systemName: "pencil.circle")
                .onTapGesture {
                    isEditing.toggle()
                }
        }
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(title: "Pseudo", editedText: .constant("Leonard"))
            .previewLayout(.sizeThatFits)
    }
}
