//
//  ContentView.swift
//  YouAreGreat
//
//  Created by AY on 22/04/1448 AH.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastSoundNumber = -1
    @State private var lastMessageNum = -1
    @State private var lastImageNum = -1
    @State private var audioPlayer : AVAudioPlayer!
    let numberOfMessages = 10
    let numberOfSounds = 6
    
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
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            Button("show Messages") {
                audioPlayer?.stop()
                let messages = ["You are Awesome!",
                                "You are Great!",
                                "I'm developer" ,
                                "I can and I will"]
                var msgNUM : Int
                repeat  {
                    msgNUM = Int.random(in: 0...messages.count-1)
                } while msgNUM == lastMessageNum
                
                var imgNUM : Int
                repeat {
                    imgNUM = Int.random(in: 0...numberOfMessages-1)
                } while imgNUM == lastImageNum
                
                message = messages[msgNUM]
                imageName = "image\(imgNUM)"
                
                lastMessageNum = msgNUM
                lastImageNum = imgNUM
                
                var soundNumber:Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds - 1)
                } while soundNumber == lastSoundNumber
                
                lastSoundNumber = (soundNumber)
                
                guard let soundFile = NSDataAsset(name: "sound\(soundNumber)") else {
                    print("‼️ Couldn't read file named sound\(soundNumber)")
                    return }
                
                do{
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }catch{
                    print("‼️ERROR: \(error.localizedDescription)")
                }
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
