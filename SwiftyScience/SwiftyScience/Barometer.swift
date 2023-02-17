//
//  Barometer.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI
import CoreMotion

struct Barometer_Previews: PreviewProvider {
    static var previews: some View {
        Barometer()
    }
}

struct Barometer: View {
    @State private var pressure: Double = 0.0
    @State private var isMetric: Bool = true
    let altimeter = CMAltimeter()
    let formatter = MeasurementFormatter()

    var body: some View {
        VStack {
            Text("Barometric Pressure:")
            Text("\(formattedPressure) \(unitLabel)")
                .font(.title)
                .padding()
            HStack {
                Spacer()
                Text("Metric")
                Toggle("", isOn: $isMetric)
                    .labelsHidden()
                Text("Imperial")
                Spacer()
            }
        }
        .onAppear {
            startUpdates()
        }
        .onDisappear {
            stopUpdates()
        }
    }

    func startUpdates() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { data, error in
                if let pressureData = data?.pressure {
                    self.pressure = pressureData.doubleValue
                }
            }
        }
    }

    func stopUpdates() {
        altimeter.stopRelativeAltitudeUpdates()
    }

    var formattedPressure: String {
        let pressureMeasurement = Measurement(value: pressure, unit: UnitPressure.hectopascals)
        let formattedValue = formatter.string(from: pressureMeasurement)
        return formattedValue
    }

    var unitLabel: String {
        return isMetric ? "hPa" : "in Hg"
    }
}
