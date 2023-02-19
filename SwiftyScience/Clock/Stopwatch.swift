//
//  Stopwatch.swift
//  SwiftyScience
//
//  Created by Ocean on 2/18/23.
//

import Foundation


import SwiftUI


struct Lap: Identifiable, Hashable {
    let id = UUID()
    let lapNumber: Int
    let totalTime: TimeInterval
    let lapTime: TimeInterval
    
    func formattedTotalTimeString() -> String {
        return totalTime.formattedTimeString()
    }
    
    func formattedLapTimeString() -> String {
        return lapTime.formattedTimeString()
    }
}

enum StopwatchDisplayDetails: String, CaseIterable {
    case totalTime = "Total"
    case lapTime = "Lap"
    case both = "Both"
}


struct StopwatchView: View {
    @State private var time: TimeInterval = 0
    @State private var timer: Timer?
    @State private var laps: [Lap] = []
    @State private var isRunning: Bool = false
    @State private var display: StopwatchDisplayDetails = .both
    
    var body: some View {
        VStack {
            Text(time.formattedTimeString())
                .font(.system(size: 50))
            
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
                    if self.isRunning {
                        self.lap()
                    } else {
                        self.reset()
                    }
                }) {
                    Text(self.isRunning ? "Lap" : "Reset")
                }
                .padding()
                
                Picker(selection: $display, label: Text("Type")) {
                    ForEach(StopwatchDisplayDetails.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            List {
                ForEach(laps.reversed(), id: \.self) { lap in
                    HStack {
                        switch display {
                        case .lapTime:
                            Text("Lap \(lap.lapNumber)")
                            Spacer()
                            Text("+\(lap.lapTime.formattedTimeString())")
                        case .totalTime:
                            Text("Lap \(lap.lapNumber)")
                            Spacer()
                            Text(lap.formattedTotalTimeString())
                        case .both:
                            Text("Lap \(lap.lapNumber)")
                            Spacer()
                            Text(lap.formattedTotalTimeString())
                            Spacer()
                            Text("+\(lap.lapTime.formattedTimeString())")
                        }
                    }
                }
            }
            
        }
    }

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.time += 0.1
        }
        isRunning = true
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    func lap() {
        if laps.isEmpty {
            laps.append(Lap(lapNumber: 1, totalTime: time, lapTime: time))
        } else {
            let previousLap = laps.last!
            let lapTime = time - previousLap.totalTime
            let lapNumber = previousLap.lapNumber + 1
            laps.append(Lap(lapNumber: lapNumber, totalTime: time, lapTime: lapTime))
        }
    }


    func reset() {
        time = 0
        laps.removeAll()
    }
}



extension TimeInterval {
    func formattedTimeString() -> String {
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        let milliseconds = Int((self.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02i:%02i.%02i", minutes, seconds, milliseconds)
    }
}






struct Stopwatch_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
