//
//  ContentView.swift
//  Clicker
//
//  Created by Damien FURIET on 13/06/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("pseudo") var pseudo:String = "Personne"
    @State var score = 0
    @AppStorage("bestScore") var bestScore = 0
    @State var gameIsInProgress = false
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $pseudo)
            HStack {
                if score > bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score = \(score)")
                    .padding()

            }.font(.title)
            if bestScore > 0 {
                HStack {
                    Image(systemName: "star")
                    Text("\(pseudo) - \(bestScore)")
                    Image(systemName: "star")
                }
            }
            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        score = score + 1
                    }
            }
            Spacer()
            if gameIsInProgress == false {
                Button("Nouvelle partie") {
                    score = 0
                    gameIsInProgress = true
                    Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
                        gameIsInProgress = false
                        if score > bestScore {
                            bestScore = score
                        }
                    }
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pseudo: "Personne")
    }
}
