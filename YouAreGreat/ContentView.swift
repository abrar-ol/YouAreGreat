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
    @State private var lastMessageNum = 0
    @State private var lastImageNum = 0
    
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
                                "I'm developer" ,
                                "I can and I will"]
                var msgNUM = Int.random(in: 0...messages.count-1)
                while msgNUM == lastMessageNum {
                    msgNUM = Int.random(in: 0...messages.count-1)
                }
                
                var imgNUM = Int.random(in: 0...9)
                while imgNUM == lastImageNum {
                    imgNUM = Int.random(in: 0...9)
                }
                
                message = messages[msgNUM]
                
                imageName = "image\(imgNUM)"
                
                lastMessageNum = msgNUM
                lastImageNum = imgNUM
                
                
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
