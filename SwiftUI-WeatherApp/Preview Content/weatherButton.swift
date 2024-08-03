//
//  weatherButton.swift
//  SwiftUI-WeatherApp
//
//  Created by Charithra Jayasingha on 2024-08-03.
//

import SwiftUI

struct WeatherButton: View {
    var title : String
    var backgroundColor : Color
    var fontColor : Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(fontColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

