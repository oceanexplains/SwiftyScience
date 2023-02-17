//
//  Gyroscope.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI
import CoreMotion


struct Gyroscope: View {

    @State private var xInclination: Double = 0.0
    @State private var yInclination: Double = 0.0
    @State private var zInclination: Double = 0.0
    let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            Text("Gyroscope")
            HStack {
                Text("X: \(xInclination, specifier: "%.2f")°")
                Text("Y: \(yInclination, specifier: "%.2f")°")
                Text("Z: \(zInclination, specifier: "%.2f")°")
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
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
                if let rotationRate = data?.rotationRate {
                    let xRotationRate = rotationRate.x
                    let yRotationRate = rotationRate.y
                    let zRotationRate = rotationRate.z
                    let xInclinationRadians = atan2(yRotationRate, zRotationRate)
                    let yInclinationRadians = atan2(xRotationRate, zRotationRate)
                    let zInclinationRadians = atan2(xRotationRate, yRotationRate)
                    self.xInclination = xInclinationRadians * (180 / Double.pi)
                    self.yInclination = yInclinationRadians * (180 / Double.pi)
                    self.zInclination = zInclinationRadians * (180 / Double.pi)
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopGyroUpdates()
    }
}

