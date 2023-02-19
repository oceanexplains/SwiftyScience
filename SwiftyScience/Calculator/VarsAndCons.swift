//
//  VarsAndCons.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/18/23.
//

import Foundation
import SwiftUI

struct Variables: View {
    
    @Binding var history: String
    @Binding var expression: String
    @Binding var result: String
    
    @Binding var showingVars: Bool
    
    var body: some View {
        HStack {
            Text("")
        }
    }
}

struct Constants: View {
    
    @Binding var history: String
    @Binding var expression: String
    @Binding var result: String
    
    @Binding var showingCons: Bool
    
    let constants: [(String,Double)] = [
        ("pi", 3.14159),
        ("e", 2.718),
        ("c", 299_792_458),
        ("Avogadro", 6.226*pow(10, 34))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 5) {
                ForEach(constants, id: \.0) { (key, value) in
                    Button {
                        expression += "\(value)"
                    } label: {
                        Text(key)
                            .bold()
                            .font(.subheadline)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
}



struct Trigs: View {
    
    @Binding var history: String
    @Binding var expression: String
    @Binding var result: String
    
    @Binding var showingTrig: Bool
    
    let trigs: [(String,String)] = [
        ("sin", "sin("),
        ("cos", "cos("),
        ("tan", "tan("),
        ("sinh", "sinh("),
        ("cosh", "cosh("),
        ("tanh", "tanh("),
        ("invsin", "invsin("),
        ("invcos", "invcos("),
        ("invtan", "invtan(")
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 5) {
                ForEach(trigs, id: \.0) { (key, value) in
                    Button {
                        expression += "\(value)"
                    } label: {
                        Text(key)
                            .bold()
                            .font(.subheadline)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
}


//struct Trigs: View {
//
//    @Binding var history: String
//    @Binding var expression: String
//    @Binding var result: String
//
//    @Binding var showingTrig: Bool
//
//    let trigs = ["sin", "cos", "tan", "sinh", "cosh", "tanh", "invsin", "invcos", "invtan"]
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack(spacing: 5) {
//                ForEach(trigs, id: \.self) { trig in
//                    Button {
//                        expression += trig
//                    } label: {
//                        Text(trig)
//                            .bold()
//                            .font(.subheadline)
//                            .padding(10)
//                            .background(Color.black)
//                            .clipShape(RoundedRectangle(cornerRadius: 5))
//                            .frame(height: 30)
//                            .clipShape(RoundedRectangle(cornerRadius: 5))
//                    }
//                }
//            }
//        }
//    }
//}




struct ExpressionField: View {
    
    @Binding var expression: String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
                .frame(maxHeight: 50)
                
            Text(expression)
                .font(.headline)
                .padding()
            
        }
    }
}
