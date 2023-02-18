//
//  SwiftyScienceApp.swift
//  SwiftyScience
//
//  Created by Ocean on 2/16/23.
//Grid Help:
//https://sarunw.com/posts/swiftui-grid/
//https://medium.com/devtechie/new-in-swiftui-4-grid-view-58ec3004d717

import SwiftUI

@main
struct SwiftyScienceApp: App {
    
//    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.01) //BubbleLevel
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            CalculatorView()
//            LevelView().environmentObject(motionDetector)
        }
    }
}
