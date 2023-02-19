//
//  Accelerometer.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI
import CoreMotion


struct Accelerometer: View {

    @State private var xAcceleration: Double = 0.0
    @State private var yAcceleration: Double = 0.0
    @State private var zAcceleration: Double = 0.0
    let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            Text("Accelerometer")
            HStack {
                Text("X: \(xAcceleration, specifier: "%.2f") m/s²")
                Text("Y: \(yAcceleration, specifier: "%.2f") m/s²")
                Text("Z: \(zAcceleration, specifier: "%.2f") m/s²")
            }
        }
        .onAppear() {
            startMotionUpdates()
        }
        .onDisappear() {
            stopMotionUpdates()
        }
    }
    
    func startMotionUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
                if let acceleration = data?.acceleration {
                    self.xAcceleration = acceleration.x
                    self.yAcceleration = acceleration.y
                    self.zAcceleration = acceleration.z
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}
