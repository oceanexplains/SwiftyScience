//
//  Clock.swift
//  SwiftyScience
//
//  Created by Ocean on 2/18/23.
//


import SwiftUI

enum ClockViewType: String, CaseIterable {
    case timer = "Timer"
    case stopwatch = "Stopwatch"
}

struct ClockView: View {
    @State private var selectedView: ClockViewType = .stopwatch
    
    var body: some View {
        VStack {
            Picker(selection: $selectedView, label: Text("Clock Type")) {
                ForEach(ClockViewType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                        .foregroundColor(selectedView == type ? .red : .white)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            switch selectedView {
            case .timer:
                TimerView()
            case .stopwatch:
                StopwatchView()
            }
        }.background(.black)
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
