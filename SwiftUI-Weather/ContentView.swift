//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Thenya Kamau on 17/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            WeatherView().tabItem{
                Image(systemName: "cloud.fill")
                Text("Weather")
            }
            VideoListView().tabItem{
                Image(systemName: "list.bullet")
                Text("List")
            }
            FormView().tabItem{
                Image(systemName: "person.fill")
                Text("Account")
            }
        }.accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

