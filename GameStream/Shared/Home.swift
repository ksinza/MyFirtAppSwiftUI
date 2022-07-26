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
    
    @State var textoBusqueda = ""
    
    
    var body: some View{
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                
                
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding( .horizontal, 11.0 )
                
                HStack{
                    
                    Button(action: Busqueda, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian")
                        
                        
                        )
                        
                        
                        
                    })
                    
                    ZStack(alignment: .leading){
                        
                        if textoBusqueda.isEmpty{
                            Text("Buscar un video").foregroundColor(
                                Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            
                        }
                        TextField("", text: $textoBusqueda)
                                .foregroundColor(.white)
                            
                       
                        
                        
                        
                        
                    }
                    
                }
                .padding([.top, .leading, .bottom], 11.0)
                .background(Color("blue-gray"))
                .clipShape(Capsule())
                
                

            }.padding(.horizontal,18)
            
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
       
    }
    
    
    func Busqueda(){
        
        print("el usuario esta buscando \(textoBusqueda)")
        
    }
    
}


struct SubModuloHome:View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
        
        
        VStack{
            
            Text("")

        }
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
