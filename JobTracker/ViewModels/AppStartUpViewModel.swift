//
//  AppStartUpViewModel.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 7/22/26.
//

import Foundation

// Handles the logic behind the splash screen — NOT the visuals.
// Its job is to figure out when the app is "ready" and update loadingState accordingly.
@Observable
class AppStartupViewModel {

    // The current startup state. RootView watches this to know what to display.
    // Starts as .loading since the app always begins in a "not ready yet" state.
    var loadingState: AppLoadingState = .loading

    // Called once when the app launches (from RootView's .task).
    // Runs two things concurrently: a minimum display timer, and a real readiness check.
    func performStartup() async {

        // async let starts both of these running AT THE SAME TIME, not one after another.
        // Neither line actually pauses here — they just kick off in the background.
        async let minimumDisplay: () = waitMinimumDuration()
        async let readiness: () = checkAppReadiness()

        // This is where we actually wait. It pauses until BOTH tasks above are done.
        // Whichever one takes longer determines how long this line blocks —
        // so if readiness takes 3 seconds, we wait 3 seconds (not 1 + 3).
        // The underscore just means we're ignoring the return values (both are Void here).
        _ = await (minimumDisplay, readiness)

        // Both tasks finished — safe to tell the app to show real content now.
        loadingState = .ready
    }

    // Ensures the splash screen shows for AT LEAST 1 second,
    // even if the real readiness check finishes instantly.
    // This avoids a jarring "flash" if startup happens to be super fast.
    private func waitMinimumDuration() async {
        try? await Task.sleep(for: .seconds(1))
    }

    // Placeholder for real startup work (e.g. checking SwiftData,
    // loading user settings, checking auth state, etc. in the future).
    // Currently does nothing, so it finishes immediately —
    // meaning the 1-second minimum timer above is what actually controls duration for now.
    private func checkAppReadiness() async {
        // Nothing real to check yet — add real startup logic here later.
    }
}
