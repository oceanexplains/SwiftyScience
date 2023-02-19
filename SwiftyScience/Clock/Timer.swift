//
//  Timer.swift
//  SwiftyScience
//
//  Created by Ocean on 2/18/23.
//

import Foundation


import SwiftUI

struct TimerView: View {
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    @State private var timeRemaining = 0
    @State private var timer: Timer?
    @State private var isRunning = false
    @State private var started = false
    
    var body: some View {
        VStack {
            Text("\(timeRemaining)")
                .font(.title)
                .foregroundColor(.white)
            if self.started {
                ProgressView(value: CGFloat(timeRemaining) / CGFloat(hours * 3600 + minutes * 60 + seconds))
                    .frame(height: 20)
            }
            HStack {
                Spacer()
                
                Button {
                    if self.isRunning {
                        self.pause()
                    } else if self.started  {
                        self.play()
                    } else {
                        self.start()
                    }
                } label: {
                    Text(self.isRunning ? "Pause" : self.started ? "Play" : "Start")
                        .padding()
                        .frame(width: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(hours * 3600 + minutes * 60 + seconds <= 0)

                
                Spacer()
                
                Button(action: {
                    self.cancel()
                }) {
                    Text("Cancel")
                        .padding()
                        .frame(width: 100)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Picker(selection: $hours, label: Text("Hours")) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)").foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 80)
                
                Text("hr")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Picker(selection: $minutes, label: Text("Minutes")) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)").foregroundColor(.white)
                    }
                }.pickerStyle(.wheel)
                .frame(width: 80)
                
                Text("min")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Picker(selection: $seconds, label: Text("Seconds")) {
                    ForEach(0..<60) { second in
                        Text("\(second)").foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 80)
                
                Text("sec")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            .font(.title)
            
            Spacer()
        }
        .padding()
    }
    
    func start() {
        timeRemaining = hours * 3600 + minutes * 60 + seconds
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining <= 1 {
                self.timeRemaining = 0
                self.pause()
            } else {
                self.timeRemaining -= 1
            }
            
            if self.timeRemaining <= 0 {
                self.pause()
            }
        }
        isRunning = true
        started = true
    }
    
    func play() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timeRemaining -= 1
            if self.timeRemaining == 0 {
                self.pause()
            }
        }
        isRunning = true
    }
    
    
    func pause() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func cancel() {
        timer?.invalidate()
        timer = nil
        hours = 0
        minutes = 0
        seconds = 0
        started = false
        if !isRunning {
            timeRemaining = 0
        }
        isRunning = false
    }
}






//
//struct TimerView: View {
//    @State private var timeRemaining: TimeInterval = 0
//    @State private var selectedTime: TimeInterval = 60
//    @State private var timer: Timer?
//    @State private var isRunning: Bool = false
//
//    var body: some View {
//        VStack {
//            Text(timeRemaining.formattedTimeString())
//                .font(.system(size: 50))
//
//            DatePicker("", selection: Binding(
//                get: { Date(timeIntervalSinceReferenceDate: self.selectedTime) },
//                set: { self.selectedTime = $0.timeIntervalSinceReferenceDate }
//            ), displayedComponents: [.hourAndMinute])
//            .datePickerStyle(WheelDatePickerStyle())
//            .labelsHidden()
//            .padding()
//
//            HStack {
//                Button(action: {
//                    if self.isRunning {
//                        self.stop()
//                    } else {
//                        self.start()
//                    }
//                }) {
//                    Text(self.isRunning ? "Stop" : "Start")
//                }
//                .padding()
//
//                Button(action: {
//                    self.reset()
//                }) {
//                    Text("Reset")
//                }
//                .padding()
//            }
//        }
//    }
//
//    func start() {
//        timeRemaining = selectedTime
//        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
//            self.timeRemaining -= 0.1
//
//            if self.timeRemaining <= 0 {
//                self.stop()
//            }
//        }
//        isRunning = true
//    }
//
//    func stop() {
//        timer?.invalidate()
//        timer = nil
//        isRunning = false
//    }
//
//    func reset() {
//        stop()
//        timeRemaining = 0
//    }
//}





struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
