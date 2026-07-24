//
//  RootView.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/22/26.
//

import SwiftUI

// This is the TRUE root of the app's UI — sits above everything else.
// Its only job: decide whether to show the splash screen or the real app content.
struct RootView: View {

    // Owns the startup ViewModel. @State keeps it alive for RootView's lifetime.
    @State private var startupViewModel = AppStartupViewModel()

    var body: some View {
        // Group lets us return different views from a switch without extra wrapping views.
        Group {
            switch startupViewModel.loadingState {
            case .loading:
                SplashView()   // shown while the app is still starting up
            case .ready:
                ContentView()  // shown once startup is complete — your real first screen
            }
        }
        // .task runs once when RootView appears, and supports async code natively.
        // This kicks off the startup process defined in AppStartupViewModel.
        .task {
            await startupViewModel.performStartup()
        }
    }
}
