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
                ExpressionField(expression: $expression)
                    .padding(.horizontal, 20)
                    .padding(.top, 60)
                
                ExpressionField(expression: $result)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                if showingVars {
                    Variables(
                        history: $history,
                        expression: $expression,
                        result: $result,
                        showingVars: $showingVars
                    )
                    .padding(.horizontal, 20)
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
                    .padding(.horizontal, 20)
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
                    .padding(.horizontal, 20)
                } else {
                    Spacer()
                }
                
                Spacer()
                
                CalculatorSuggestions(showingTrig: $showingTrig, showingVars: $showingVars, showingExps: $showingExps, showingCons: $showingCons)
                    .padding(.horizontal, 20)
                
                HStack {
                    AuxCalculatorButtons(showingTrig: $showingTrig, showingVars: $showingVars, showingExps: $showingExps, showingCons: $showingCons)
                    
                    MainCalculatorButtons(history: $history, expression: $expression, result: $result)
                }
                .padding(.horizontal, 20)
                
            }
            .padding(.bottom)
            .foregroundColor(.white)
            .font(.system(size: 24))
        }
        .ignoresSafeArea()
    }
}


struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()
    }
}





