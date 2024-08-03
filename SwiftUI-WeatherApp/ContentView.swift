//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Charithra Jayasingha on 2024-08-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityView(city: "Colombo-Srilanka")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 56)
                
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "MON",imageName: "cloud.sun.fill",temperature: 36)
                    WeatherDayView(dayOfWeek: "TUE",imageName: "cloud.sleet.fill",temperature: 32)
                    WeatherDayView(dayOfWeek: "WED",imageName: "cloud.drizzle.fill",temperature: 29)
                    WeatherDayView(dayOfWeek: "THU",imageName: "cloud.heavyrain.fill",temperature: 32)
                    WeatherDayView(dayOfWeek: "FRI",imageName: "cloud.sun.rain.fill",temperature: 33)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(
                        title: "Change Day Time",
                        backgroundColor: .white,
                        fontColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding  var isNight : Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? Color.black : Color.blue, isNight ? Color.gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityView: View {
    var city: String
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing:28){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

