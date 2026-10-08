//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var image = ""
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Button("Press Me") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let image1 = "sun.max.fill"
                let image2 = "hand.thumbsup.fill"
                
                
                message = message == message1 ? message2 : message1
                image = image == image1 ? image2 : image1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.purple)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
