//
//  ShiftableButton.swift
//  SwiftyScience
//
//  Created by Ocean on 2/17/23.
//

import SwiftUI

struct ShiftableButtonView: View {
    var main: String
    var alt: String
    
    var body: some View {
        VStack {
            Text(alt).foregroundColor(Color(.systemBlue))
                .font(.system(size: 10))
            Text(main).foregroundColor(.white)
        }
        .frame(width: 50, height: 50)
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct ShiftableButton_Previews: PreviewProvider {
    static var previews: some View {
        ShiftableButtonView(main: "sin", alt: "1/sin")
    }
}


