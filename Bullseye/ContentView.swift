//
//  ContentView.swift
//  Bullseye
//
//  Created by Chris Eadie on 21/05/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        
        VStack {
            VStack {
                Spacer()
                // Target Row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                    Text(String(self.target))
                }
                Spacer()
                
                // Slider row
                HStack {
                    Text("1")
                    Slider(value: self.$sliderValue, in: 1...100)
                    Text("100")
                }
                Spacer()
                
                // Button row
                Button(action: {
                    print("Button pressed")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    let sliderValueMessage: String = "The slider's value is \(roundedValue)."
                    let pointsScoredMessage: String = "You scored \(self.pointsForCurrentRound()) points this round."
                    
                    return Alert(title: Text("Hello there"), message: Text(sliderValueMessage + "\n" + pointsScoredMessage), dismissButton: .default(Text("Awesome!")))
                }
                Spacer()
                
                // Score row
                HStack {
                    Button(action: {
                        print("Resetting game")
                    }) {
                        Text("Start Over")
                    }
                    Spacer()
                    Text("Score:")
                    Text("999999")
                    Spacer()
                    Text("Round:")
                    Text("999")
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
    
    func pointsForCurrentRound() -> Int {
        if self.sliderValue > Double(self.target) {
            return Int(Double(self.target) - self.sliderValue)
        } else if self.sliderValue < Double(self.target){
            return Int(self.sliderValue - Double(self.target))
        } else {
            return 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
