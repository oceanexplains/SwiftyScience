//
//  Calculator.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/18/23.
//

import SwiftUI
import MathExpression



struct Calculator: View {
    @State private var history = ""
    @State private var expression = ""
    @State private var result = ""
    
    @State var showingTrig: Bool = false
    @State var showingVars: Bool = false
    @State var showingExps: Bool = false
    @State var showingCons: Bool = true
    
    @State var variables: [String:Double] = [:]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
//                Text(expression)
                ExpressionField(expression: $expression)
                    .padding(.horizontal)
                    .padding(.top, 60)
//                Text(result)
                ExpressionField(expression: $result)
                    .padding(.horizontal)
                Spacer()
                if showingVars {
                    Variables(
                        history: $history,
                        expression: $expression,
                        result: $result,
                        showingVars: $showingVars
                    )
                    .padding(.horizontal)
                } else {
                    Spacer()
                }
                
                if showingCons {
                    Constants(
                        history: $history,
                        expression: $expression,
                        result: $result,
                        showingCons: $showingCons
                    )
                    .padding(.horizontal)
                } else {
                    Spacer()
                }
                
                if showingTrig {
                    Trigs(
                        history: $history,
                        expression: $expression,
                        result: $result,
                        showingTrig: $showingTrig
                    )
                    .padding(.horizontal)
                } else {
                    Spacer()
                }
                
                Spacer()
                CalculatorSuggestions(showingTrig: $showingTrig, showingVars: $showingVars, showingExps: $showingExps, showingCons: $showingCons)
                    .padding(.horizontal)
                HStack {
                    AuxCalculatorButtons(showingTrig: $showingTrig, showingVars: $showingVars, showingExps: $showingExps, showingCons: $showingCons)
                    MainCalculatorButtons(history: $history, expression: $expression, result: $result)
                }
                
            }
            .padding(.bottom)
        }
        .ignoresSafeArea()
    }
    
    func evaluateExpression() {
        do {
            let math = try MathExpression(expression)
            result = String(math.evaluate())
            expression = ""
        } catch {
            print("Error evaluating expression: \(error)")
        }
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()
    }
}





