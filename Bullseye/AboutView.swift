//
//  AboutView.swift
//  Bullseye
//
//  Created by Chris Eadie on 26/05/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯").multilineTextAlignment(TextAlignment.center)
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").multilineTextAlignment(TextAlignment.center)
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").multilineTextAlignment(TextAlignment.center)
            Text("Enjoy!").multilineTextAlignment(TextAlignment.center)
        }
        .navigationBarTitle("About Bullseye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

