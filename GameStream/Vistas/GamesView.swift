//
//  GamesView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 3/08/22.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var todosLosVideoJuegos =  ViewModel()
    
    
    
    var body: some View {
        Text("Hola desde pantalla Gameview")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    
                    print("primer elemento de json: \(todosLosVideoJuegos.gamesInfo[0])")
                    
                    
                    print("titulo del primer video juego  \(todosLosVideoJuegos.gamesInfo[0].title)")
                    
                }
            
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
