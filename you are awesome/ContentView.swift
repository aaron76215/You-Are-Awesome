//
//  ContentView.swift
//  you are awesome
// //  Created by GARCIA, AARON on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = 1
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
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message!") {
                let messages = ["You Are Awesome!",
                                "Gadzooks my Friend! I am Astonished at How Utterly Magnificent You Are!!",
                                "When the Genuis Bar Needs Help, They Call You!",
                                "You Are Fantastic!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Make Me Smile!"]
                
                //step 1: generate rand messageNumber to use as an index
                //if messageNumber == lastMessageNumer {
                //  keep generating a new rand messageNumber
                //  until you get a messageNnumber != lastMessageNumber
                // set messageString to messages[messageNumber]
                //update the lastMessageNumber with messageNumber
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber

                var imageNumber = Int.random(in: 0...9)
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .padding()
    }
    
}


#Preview {
    ContentView()
}

