//
//  IMU.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI

struct IMU: View {
    var body: some View {
        VStack {
            Gyroscope()
            Magnetometer()
            Accelerometer()
        }
    }
}

struct IMU_Previews: PreviewProvider {
    static var previews: some View {
        IMU()
    }
}
