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
            Spacer()
            Color( red: 19/255, green: 30/255, blue: 53/255, opacity: 1).ignoresSafeArea()
            VStack{
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding( .bottom, 42 )
                
               InicioYRegistroView()
            }
            
          
        }
    }
}

struct InicioYRegistroView:View {
    
    @State var tipoInicioSession: Bool   = true
    
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Spacer()
                
                Button ("INICIA SESSION") {
                    print("iniciar session")
                    tipoInicioSession=true;
                }
                .foregroundColor(tipoInicioSession ? .white : .gray)
                
                
                Spacer()
                
                Button ("REGISTRATE") {
                    print("REGISTRATE")
                    tipoInicioSession=false;

                }
                
                .foregroundColor(tipoInicioSession ? .gray : .white)
                
                Spacer()
              
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSession == true{
                InicioSessionView()
                
            }else{
                
                RegistroView()
                
            }
        }
        
    }
}


struct  InicioSessionView: View {
    
    var body: some View {
        
        Text("Soy la vista de session view")
    }
}


struct  RegistroView: View {
    
    var body: some View {
        
        Text("Soy la vista de RegistroView")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        Image("pantalla01").resizable()

        ContentView()
        
        
    }
}
