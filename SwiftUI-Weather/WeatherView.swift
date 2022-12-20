//
//  WeatherView.swift
//  SwiftUI-Weather
//
//  Created by Thenya Kamau on 19/12/2022.
//

import SwiftUI

struct WeatherView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }.padding(.bottom, 40)
                
                
                HStack(alignment: .center, spacing: 20) {
                    WeatherDayView(title: "TUE", icon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 74)
                    WeatherDayView(title: "WED", icon: "sun.max.fill", temp: 88)
                    WeatherDayView(title: "THU", icon: "wind.snow", temp: 55)
                    WeatherDayView(title: "FRI", icon: "sunset.fill", temp: 60)
                    WeatherDayView(title: "SAT", icon: "snow", temp: 25)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    StandardButtonView(title: "Change Day Time",textColor: .blue, backgroundColor: .white)
                })
                
                Spacer()
                
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

struct WeatherDayView: View {
    var title: String
    var icon: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}



struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient:Gradient(
                colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct StandardButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default))
            .background(backgroundColor)
            .foregroundColor(textColor)
        
    }
}


