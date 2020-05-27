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
    let midnightBlue = Color(red: 0.0/255.0, green: 52.0/255.0, blue: 102.0/255.0)
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
            
    }
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("ArialRoundedMTBold", size: 18))
        }
            
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content.modifier(LabelStyle())
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("ArialRoundedMTBold", size: 24))
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 12))
        }
    }
    
    var body: some View {
        
        VStack {
            VStack {
                Spacer()
                // Target Row
                HStack {
                    Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                    Text(String(target)).modifier(ValueStyle())
                }
                Spacer()
                
                // Slider row
                HStack {
                    Text("1").modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                    Text("100").modifier(LabelStyle())
                }
                Spacer()
                
                // Button row
                Button(action: {
                    print("Score points")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextStyle())
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let sliderValueMessage = "The slider's value is \(roundedSliderValue())."
                    let pointsScoredMessage = "You scored \(hitMeResponse()[1])\(self.pointsForCurrentRound()) points this round."
                    
                    return Alert(title: Text(hitMeResponse()[0]), message: Text(sliderValueMessage + "\n" + pointsScoredMessage), dismissButton: .default(Text("Ok")) {
                        self.addToScore()
                        self.nextRound()
                        self.randomizeTarget()
                    })
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                
                // Score row
                HStack {
                    Button(action: {
                        print("Resetting game")
                        self.resetEverything()
                    }) {
                        HStack {
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier(Shadow())
                    Spacer()
                    Text("Score:").modifier(LabelStyle())
                    Text(String(score)).modifier(ValueStyle())
                    Spacer()
                    Text("Round:").modifier(LabelStyle())
                    Text(String(round)).modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image("InfoIcon")
                            Text("Info").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")).modifier(Shadow())
                }
                .padding(.bottom, 20)
            }
            .background(Image("Background"), alignment: .center)
            .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
        }
    }
    
    func roundedSliderValue() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        100 - abs(target - roundedSliderValue())
    }
    
    func pointsForCurrentRound() -> Int {
        switch amountOff() {
        case 100:
            return 200
        case 99:
            return 149
        default:
            return amountOff()
        }
    }
    
    func hitMeResponse() -> [String] {
        switch amountOff() {
        case 100:
            return ["Perfect!", "all "]
        case 99:
            return ["Just off","a good "]
        case 95...98:
            return ["Almost!", ""]
        case 90...94:
            return ["Not bad", ""]
        default:
            return ["Are you even trying", "only "]
        }
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
        round = 1
        sliderValue = 50.0
        randomizeTarget()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
