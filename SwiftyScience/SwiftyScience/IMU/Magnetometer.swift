//
//  Magnetometer.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI
import CoreMotion


struct Magnetometer: View {

    @State private var xMagneticField: Double = 0.0
    @State private var yMagneticField: Double = 0.0
    @State private var zMagneticField: Double = 0.0
    let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            Text("Magnetometer")
            HStack {
                Text("X: \(xMagneticField, specifier: "%.2f") μT")
                Text("Y: \(yMagneticField, specifier: "%.2f") μT")
                Text("Z: \(zMagneticField, specifier: "%.2f") μT")
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
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdates(to: OperationQueue.current!) { (data, error) in
                if let magneticField = data?.magneticField {
                    self.xMagneticField = magneticField.x
                    self.yMagneticField = magneticField.y
                    self.zMagneticField = magneticField.z
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopMagnetometerUpdates()
    }
}
