//
//  AppLoadingState.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/22/26.
//

import Foundation

// Represents the overall startup state of the app.
// RootView uses this to decide whether to show the splash screen or the real app.
enum AppLoadingState {
    case loading   // App is still starting up / performing startup checks
    case ready     // App has finished starting up and can show real content
}
