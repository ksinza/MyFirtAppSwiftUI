//
//  Home.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 24/07/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        TabView{
            
            Text("Perfil")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                    
                }
            
            Text("pantalla juegos")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                    
                }
            
            
            Text("pantalla home")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                    
                }
            
            
            
            Text("Pantalla favoritos")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("favoritos")
                    
                }
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
