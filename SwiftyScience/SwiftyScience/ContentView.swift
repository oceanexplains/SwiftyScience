//
//  ContentView.swift
//  SwiftyScience
//
//  Created by Ocean on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var motionDetector = MotionDetector(updateInterval: 0.01) //BubbleLevel
    
    var body: some View {
        VStack {
            Barometer()
            IMU()
            LevelView().environmentObject(motionDetector)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
