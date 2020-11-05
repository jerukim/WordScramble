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
    
    var body: some View {
        List(words, id: \.self) {
            Text($0.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
