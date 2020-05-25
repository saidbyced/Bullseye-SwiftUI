//
//  ContentView.swift
//  Bullseye
//
//  Created by Chris Eadie on 21/05/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        
        VStack {
            VStack {
                Spacer()
                // Target Row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text(String(target))
                }
                Spacer()
                
                // Slider row
                HStack {
                    Text("1")
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100")
                }
                Spacer()
                
                // Button row
                Button(action: {
                    print("Score points")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let sliderValueMessage = "The slider's value is \(roundedSliderValue())."
                    let pointsScoredMessage = "You scored \(self.pointsForCurrentRound()) points this round."
                    
                    return Alert(title: Text("Hello there"), message: Text(sliderValueMessage + "\n" + pointsScoredMessage), dismissButton: .default(Text("Awesome!")) {
                        self.addToScore()
                        self.nextRound()
                        self.randomizeTarget()
                        })
                }
                Spacer()
                
                // Score row
                HStack {
                    Button(action: {
                        print("Resetting game")
                        self.resetEverything()
                    }) {
                        Text("Start Over")
                    }
                    Spacer()
                    Text("Score:")
                    Text(String(score))
                    Spacer()
                    Text("Round:")
                    Text(String(round))
                    Spacer()
                    Button(action: {
                        print("Pop-up some info")
                    }) {
                        Text("Info")
                    }
                    
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    func roundedSliderValue() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        return 100 - abs(target - roundedSliderValue())
    }
    
    func addToScore() {
        score += pointsForCurrentRound()
    }
    
    func nextRound() {
        round += 1
    }
    
    func randomizeTarget() {
        target = Int.random(in: 1...100)
    }
    
    func resetEverything() {
        score = 0
        round = 0
        randomizeTarget()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
