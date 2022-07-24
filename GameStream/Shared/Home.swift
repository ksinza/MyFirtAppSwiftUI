//
//  Home.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 24/07/22.
//

import SwiftUI

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    
    
    
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            
            Text("Perfil")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                    
                }.tag(0)
            
            
            
            Text("pantalla juegos")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                    
                }.tag(1)
            
            
            PantallaHome()
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                    
                }.tag(2)
            
            
            
            Text("Pantalla favoritos")
                .font(
                    .system(size:30,weight: .bold, design:.rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("favoritos")
                    
                }.tag(3)
            
        }
        .accentColor(.white)
        
    }


    init() {
        
        
        UITabBar.appearance().barTintColor = UIColor(
            Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("iniciando las vistas de home")
        //iniciando las vistas de home 57 63 83
    }


}


struct PantallaHome:View {
    
    var body: some View{
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                
                
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding( .horizontal, 11.0 )
                
                HStack{
                    
                    Button(action: {
                        
                        print("crack")
                        
                    }, label: {
                        
                        Text("Button")
                        
                    })
                    
                    
                    
                }
                
                
                

            }.padding(.horizontal,18)
            
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
       
    }
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
