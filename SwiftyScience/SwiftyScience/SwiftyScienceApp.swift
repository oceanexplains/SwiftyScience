//
//  SwiftyScienceApp.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

@main
struct SwiftyScienceApp: App {
    
    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.01) //BubbleLevel
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LevelView()
                            .environmentObject(motionDetector)
        }
    }
}
