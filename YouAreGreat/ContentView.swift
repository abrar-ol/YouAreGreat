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
    @State private var isOnSound = true
    let numberOfSounds = 6
    let numberOfImages = 10
    
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
            HStack {
                Text("Sound \(isOnSound ? "On" : "Off"): ")
                Toggle("", isOn: $isOnSound)
                    .labelsHidden()
                    .onChange(of: isOnSound) {
                        if audioPlayer != nil && audioPlayer.isPlaying{
                                audioPlayer.stop()
                            }
                    }
                Spacer()
                Button("show Messages") {
                    audioPlayer?.stop()
                    let messages = ["You are Awesome!",
                                    "You are Great!",
                                    "I'm developer" ,
                                    "I can and I will"]
                    
                    lastMessageNum = nonRepeatingRandom(lastNumber:lastMessageNum,upperBounds:messages.count-1)
                    lastImageNum = nonRepeatingRandom(lastNumber:lastImageNum,upperBounds:numberOfImages-1)
                    
                    message = messages[lastMessageNum]
                    imageName = "image\(lastImageNum)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber:lastSoundNumber,upperBounds:numberOfSounds - 1)
                    
                    if isOnSound
                    {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            .tint(.accentColor)
        }
        .padding()
    }
    
    func playSound(soundName:String) {
        if(audioPlayer != nil && audioPlayer.isPlaying){
            audioPlayer.stop()
        }
        
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("‼️ Couldn't read file named \(soundName)")
            return }
        
        do{
            
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("‼️ERROR: \(error.localizedDescription)")
        }
    }
    
    func nonRepeatingRandom(lastNumber:Int, upperBounds:Int) -> Int{
        var mediaNumber:Int
        repeat  {
            mediaNumber = Int.random(in: 0...upperBounds)
        } while mediaNumber == lastNumber
        return mediaNumber;
        
    }
    
}

#Preview("Light Mode") {
    ContentView().preferredColorScheme(.light)
}
#Preview("Dark Mode") {
    ContentView().preferredColorScheme(.dark)
}
