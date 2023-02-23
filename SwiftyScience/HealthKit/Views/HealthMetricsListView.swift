//
//  HealthMetricsListView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/22/23.
//

import SwiftUI

struct HealthMetricsListView: View {
    //MARK: Metric Toggles
    @State var showSleep: Bool = false
    @State var showSteps: Bool = false
    @State var showHeartRate: Bool = false
    @State var showBodyMassIndex: Bool = false
    @State var showBodyFatPercentage: Bool = false
    @State var showBloodGlucose: Bool = false
    @State var showBloodPressure: Bool = false
    @State var showBodyTemperature: Bool = false
    
    
    
    var body: some View {
        List {
            Section("Sleep") {
                Toggle("Show Sleep", isOn: $showSleep)
            }
            Section("Activity") {
                Toggle("Show Steps", isOn: $showSteps)
            }
            Section("Heart Health") {
                Toggle("Show Heart Rate", isOn: $showHeartRate)
            }
            Section("Body Measurements") {
                Toggle("Show Body Mass Index", isOn: $showBodyMassIndex)
                Toggle("Show Body Fat Percentage", isOn: $showBodyFatPercentage)
            }
            Section("Blood") {
                Toggle("Show Blood Glucose", isOn: $showBloodGlucose)
                Toggle("Show Blood Pressure", isOn: $showBloodPressure)
            }
            Section("Temperature") {
                Toggle("Show Body Temperature", isOn: $showBodyTemperature)
            }
        }
    }
}


struct HealthMetricsListView_Previews: PreviewProvider {
    static var previews: some View {
        HealthMetricsListView()
    }
}
