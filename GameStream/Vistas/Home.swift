//
//  Home.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 24/07/22.
//

import SwiftUI
import AVKit


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
            
            
            
            //Text("pantalla juegos")
              GamesView()
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
           
//            Color("Red").ignoresSafeArea()
//
            Spacer()
            Spacer()
            VStack{
                
                Spacer()
                Spacer()
                
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(EdgeInsets(top: 45.0, leading: 45.0, bottom: 45.0, trailing: 45.0) )
                   
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
                .padding( EdgeInsets(top :10 , leading: 11.0 , bottom: 11.0, trailing: 11.0))
                .background(Color("blue-gray"))
                .clipShape(Capsule())
               
                
                Spacer()
                ScrollView(showsIndicators: false){
                    
                    SubModuloHome()
                    
                }.padding(.top, 50)
              
                .navigationBarHidden(true)

            }.padding(.horizontal,18)
                .background(Color("Marine"))
               
            
            
            
        } .ignoresSafeArea()
            
        .navigationBarHidden(true)
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
            
            Text("LOS MAS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action:{
                    url = urlVideos[0]
                    print("URL: \(url)")
                    
                    isPlayerActive = true
                    
                }, label: {
                    
                    VStack(spacing:0){
                        
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFill()
                        
                        Text("he Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                            .background(Color("blue-gray"))
                    }
                })
                
                
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
                
                
                
            } .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
            .padding(.vertical)
            
            Text("CATEGORIAS SUGERIDAS PARA TI")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                
                HStack{
                    
                    Button(action: {
                        
                        print("Pulse categoria FPS")
                        
                    }, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                            
                            
                            
                            
                            
                        }
                        
                        
                    })
                    
                    
                    Button(action: {
                        
                        print("Pulse categoria RPG")

                    }, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
                            
                            
                            
                            
                            
                        }
                        
                        
                    })
                    
                    Button(action: {
                        
                        print("Pulse categoria OpenWorld")
                    }, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 42, height: 42)
  
                        }
                        
                        
                    })
                    
                }
                
                
            }.padding(.bottom, 50)
            
            Text("RECOMENDADOS PARA TI")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                
                HStack{
                    
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                }
                
                
            }.padding(.bottom, 50)
            
            
            Text("VIDEOS QUE PODRIAN GUSTARTE")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                
                HStack{
                    
                    Button(action: {
                        url = urlVideos[5]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    
                    Button(action: {
                        url = urlVideos[6]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[7]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        Image("DEATH STRANDING")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                }
                
                
            }.padding(.bottom, 100)
            
       


        }
        
        
       
        
        
        NavigationLink(
            destination: VideoPlayer(
               player: AVPlayer(url: URL(string: url)!))
            .frame(width: 400, height: 300),
            
            isActive: $isPlayerActive,
            label: {
                
                EmptyView()
            })
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
