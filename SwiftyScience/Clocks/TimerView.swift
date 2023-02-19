//
//  TimerView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/18/23.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining: TimeInterval = 0
    @State private var selectedTime: TimeInterval = 60
    @State private var timer: Timer?
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack {
            Text(timeRemaining.formattedTimeString())
                .font(.system(size: 50))
            
            DatePicker("", selection: Binding(
                get: { Date(timeIntervalSinceReferenceDate: self.selectedTime) },
                set: { self.selectedTime = $0.timeIntervalSinceReferenceDate }
            ), displayedComponents: [.hourAndMinute])
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .padding()
            
            HStack {
                Button(action: {
                    if self.isRunning {
                        self.stop()
                    } else {
                        self.start()
                    }
                }) {
                    Text(self.isRunning ? "Stop" : "Start")
                }
                .padding()
                
                Button(action: {
                    self.reset()
                }) {
                    Text("Reset")
                }
                .padding()
            }
        }
    }
    
    func start() {
        timeRemaining = selectedTime
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.timeRemaining -= 0.1
            
            if self.timeRemaining <= 0 {
                self.stop()
            }
        }
        isRunning = true
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func reset() {
        stop()
        timeRemaining = 0
    }
}





struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
