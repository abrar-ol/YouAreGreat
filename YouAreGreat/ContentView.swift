//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var messageIndex = 0
    @State private var ImageNumber = 0
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            Button("show Messages") {
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "I'm developer"]
                
                if messageIndex == messages.count {
                    messageIndex = 0
                }
                message = messages[messageIndex]
                
                imageName = "image\(ImageNumber)"
                if ImageNumber == 9 {
                    ImageNumber = 0
                }
                
                messageIndex+=1
                ImageNumber+=1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
