//
//  AuxCalculatorButtons.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/18/23.
//

import SwiftUI

struct AuxCalculatorButtons: View {
    @Binding var showingTrig: Bool
    @Binding var showingVars: Bool
    @Binding var showingExps: Bool
    @Binding var showingCons: Bool
    
    let width: Double = 70
    let color: Color = Color.blue
    
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            GridRow {
                Button("trig") {
                    showingTrig.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(1))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("vars") {
                    showingVars.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(0.9))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("exps") {
                    showingExps.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("cons") {
                    showingCons.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(0.7))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("trig") {
                    showingTrig.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(0.6))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("trig") {
                    showingTrig.toggle()
                }
                .frame(width: width, height: 50)
                .background(color.opacity(0.5))
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
        }
    }
}
