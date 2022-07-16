//
//  ContentView.swift
//  Shared
//
//  Created by SBSCO3 on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color( red: 19/255, green: 30/255, blue: 53/255, opacity: 1).ignoresSafeArea()
            VStack{
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
               InicioYRegistroView()
            }
            
          
        }
    }
}

struct InicioYRegistroView:View {
    
    var body: some View {
        
        VStack{
            
            HStack {
                Text("INICIA SESSION")
                Text("REGISTRATE")

            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        Image("pantalla01").resizable()

        ContentView()
        
        
    }
}
