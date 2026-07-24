//
//  SplashView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/22/26.
//

import SwiftUI

// Purely visual — this view has no logic of its own.
// It just displays the app's branding while AppStartupViewModel decides when we're ready.
struct SplashView: View {
    var body: some View {
        ZStack {
            // Background color fills the entire screen, including safe areas (notch, etc.)
            Color(red: 0.106, green: 0.165, blue: 0.290) // swap for your palette color
                .ignoresSafeArea()

            // App logo/icon, centered by default inside a ZStack.
            Image(systemName: "briefcase.fill") // swap for your actual logo/icon asset
                .resizable()          // allows the image to be resized from its native size
                .scaledToFit()        // keeps proportions correct while resizing
                .frame(width: 100, height: 100)
                .foregroundStyle(.white)
        }
    }
}
