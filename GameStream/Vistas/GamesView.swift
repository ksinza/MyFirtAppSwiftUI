//
//  GamesView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 3/08/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla Gameview")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("primer elemento de json:")
                    print("titulo del primer video juego ")
                    
                }
            
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
