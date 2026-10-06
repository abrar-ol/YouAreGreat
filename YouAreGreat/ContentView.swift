//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("What is football to you?")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundStyle(.mint)
            HStack {
                Image(systemName: "figure.american.football")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.purple)
                Image(systemName: "figure.australian.football")
                    .resizable()
                    .scaledToFit()
                Image(systemName: "figure.basketball")
                    .resizable()
                    .scaledToFit()
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
