//
//  CalculatorView.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI

struct CalculatorView: View {
    @State private var expression = "0"
    @State private var result = "0"
    
    var body: some View {
        VStack {
            Text(expression)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(10)
            Text(result)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(10)
            //Spacer()
            
            HStack(spacing: 5) {
                Grid(horizontalSpacing: 5, verticalSpacing: 5) {
                    GridRow{
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
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "sin", alt: "1/sin")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "cos", alt: "1/cos")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "tan", alt: "1/tan")
                        }
                    }
                    GridRow {
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "sinh", alt: "1/sinh")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "cosh", alt: "1/cosh")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "tanh", alt: "1/tanh")
                        }
                    }
                    GridRow {
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "ln", alt: "e^x")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "log", alt: "10^x")
                        }
                        Button {
                            //
                        } label: {
                            ShiftableButtonView(main: "x^y", alt: "logxy")
                        }
                        
                    }
                    GridRow {
                        Button {
                            //
                        } label: {
                            
                        }
                        Button("ln") {
                            self.expression += "ln"
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    }
                }
                Grid(horizontalSpacing: 5, verticalSpacing: 5) {
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
                        Button("Shift") {
    //                        self.expression += "+"
                        }
                        .frame(width: 110, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .gridCellColumns(2)
                        Button("=") {
                            self.expression += "="
                        }
                        .frame(width: 110, height: 50)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .gridCellColumns(2)
                    }
                    
                }
            }
            
        }
    }
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
