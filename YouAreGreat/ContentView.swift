//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programer!"
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            HStack {
                Button("Awesome"){
                    message = "Awesome"
                }
                
                Button("Great"){
                    message = "Great"
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
