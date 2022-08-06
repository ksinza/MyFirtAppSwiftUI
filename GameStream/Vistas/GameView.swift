//
//  GameView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 6/08/22.
//

import SwiftUI

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var yearPublicacion :String
    var descripcion : String
    var tags:[String]
    var imgsUrl: [String]
    
    
    var body: some View {
        
        
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                Text("Hello, World!")
                
            }
            
        }
        
        
        
    }
    
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog",
            studio: "Sega",
            calificacion: "E+",
            yearPublicacion: "1991",
            descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
        ])
    }
}
