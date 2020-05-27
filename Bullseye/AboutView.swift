//
//  AboutView.swift
//  Bullseye
//
//  Created by Chris Eadie on 26/05/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige  = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    
    struct GeneralTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
            
    }
    
    struct HeadingTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(GeneralTextStyle())
                .font(Font.custom("ArialRoundedMTBold", size: 30))
                .padding(.top, 20)
        }
            
    }
    
    struct BodyTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .modifier(GeneralTextStyle())
                .font(Font.custom("ArialRoundedMTBold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
        }
            
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(HeadingTextStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(BodyTextStyle())
                Text("Your goal is to place the slider as close as possible to the target value.\nThe closer you are, the more points you score.").modifier(BodyTextStyle())
                Text("Enjoy!").modifier(BodyTextStyle())
                
            }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

