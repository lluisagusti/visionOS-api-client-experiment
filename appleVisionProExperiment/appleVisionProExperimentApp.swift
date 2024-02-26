//
//  appleVisionProExperimentApp.swift
//  appleVisionProExperiment
//
//  Created by Lluís Agustí on 26/2/24.
//

import SwiftUI

@main
struct appleVisionProExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
