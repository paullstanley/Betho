//
//  HomeView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        NavigationLink(destination: GameListView()) {
                            Text("Create Game")
                        }
                        .buttonStyle(TitleButtonStyle(color: .accentColor))
                        NavigationLink(destination: PickGameToPlayView()) {
                            Text("Play Game")
                        }
                        .buttonStyle(TitleButtonStyle(color: .accentColor))  
                    }
                }
            }
        }
    }
}

struct TitleButtonStyle: ButtonStyle {
    var color: Color = .green
    
    public func makeBody(configuration: TitleButtonStyle.Configuration)-> some View {
        TitleButton(configuration: configuration, color: color)
    }
}

struct TitleButton: View {
    let configuration: TitleButtonStyle.Configuration
    let color: Color
    
    var body: some View {
        return configuration.label
            .foregroundColor(.white)
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 5).fill(color))
            .compositingGroup()
            .shadow(color: .black, radius: 3)
            .opacity(configuration.isPressed ? 0.5: 1.0)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
