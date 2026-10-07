//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI

struct ContentView: View {
    @State var createdSymbol = ""
    @State var isPressed = false
    var body: some View {
        VStack {
            
            Button("Press me"){
                isPressed=true
                createdSymbol = "suit.heart"
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            if(isPressed){
                Image(systemName: createdSymbol)
                    .font(.largeTitle)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
