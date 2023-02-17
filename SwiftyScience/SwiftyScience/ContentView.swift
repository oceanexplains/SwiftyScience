//
//  ContentView.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        IMU()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
