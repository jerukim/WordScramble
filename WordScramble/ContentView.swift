//
//  ContentView.swift
//  WordScramble
//
//  Created by Jeru Kim on 11/4/20.
//  Copyright © 2020 Jeru Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static var fileContents: String {
        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileUrl) {
                return fileContent
            }
        }
        return "file could not be read"
    }
    
    private var words: [String] {
        return ContentView.fileContents.components(separatedBy: "\n")
    }
    
    @State private var rootWord = "word"
    @State private var newWord = ""
    @State private var usedWords = [String]()

    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespaces)
        
        guard !answer.isEmpty else {
            newWord = answer // remove white spaces from answer
            return
        }
        
        // validate word is actual word & word is made of letters from rootWord before insterting
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        // ensure that the text field stays selected so user doesn't have to manually reselect
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                }
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
