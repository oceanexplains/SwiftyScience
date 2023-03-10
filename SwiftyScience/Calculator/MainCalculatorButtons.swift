//
//  MainCalculatorButtons.swift
//  SwiftyScience
//
//  Created by Tomer Zilbershtein on 2/18/23.
//

import SwiftUI
import MathExpression

struct MainCalculatorButtons: View {
    @Binding var history: String
    @Binding var expression: String
    @Binding var result: String
    
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            GridRow {
                Button("c") {
                    self.expression = ""
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("ce") {
                    self.history = ""
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("(") {
                    self.expression += "("
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button(")") {
                    self.expression += ")"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("7") {
                    self.expression += "7"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("8") {
                    self.expression += "8"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("9") {
                    self.expression += "9"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("/") {
                    self.expression += "/"
                }
                .frame(width: 50, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("4") {
                    self.expression += "4"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("5") {
                    self.expression += "5"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("6") {
                    self.expression += "6"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("*") {
                    self.expression += "*"
                }
                .frame(width: 50, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                Button("1") {
                    self.expression += "1"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("2") {
                    self.expression += "2"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("3") {
                    self.expression += "3"
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("-") {
                    self.expression += "-"
                }
                .frame(width: 50, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            GridRow {
                
                Button("0") {
                    self.expression += "0"
                }
                .frame(width: 110, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .gridCellColumns(2)
                Button(".") {
                    self.expression += "."
                }
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Button("+") {
                    self.expression += "+"
                }
                .frame(width: 50, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
            }
            GridRow {
                Button("EE") {
//                        self.expression += "+"
                }
                .frame(width: 110, height: 50)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .gridCellColumns(2)
                Button("=") {
                    evaluateExpression()
                }
                .frame(width: 110, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .gridCellColumns(2)
            }
            
        }
    }
    
    func evaluateExpression() {
        do {
            let math = try MathExpression(expression)
            result = String(math.evaluate())
//            expression = ""
        } catch {
            print("Error evaluating expression: \(error)")
        }
    }
}
