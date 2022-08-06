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
    
//    @State var textoBusqueda = ""
    
    
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
                //pasar amodulo sudmuhlo home
//                HStack{
//
//                    Button(action: Busqueda, label: {
//                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian")
//
//
//                        )
//
//
//
//                    })
//
//                    ZStack(alignment: .leading){
//
//                        if textoBusqueda.isEmpty{
//                            Text("Buscar un video").foregroundColor(
//                                Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
//
//                        }
//                        TextField("", text: $textoBusqueda)
//                            .foregroundColor(.white)
//
//
//
//
//
//
//                    }
//
//                }
//                .padding( EdgeInsets(top :10 , leading: 11.0 , bottom: 11.0, trailing: 11.0))
//                .background(Color("blue-gray"))
//                .clipShape(Capsule())
                
                
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
    
 
    
}


struct SubModuloHome:View {
    
//    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    @State var textoBusqueda = ""

    @State var isGameInfoEmpty : Bool = false
    
    @ObservedObject var juegoEncontrado = SearchGame()
    
    @State var isGameViewActive =  false
    
    
    @State var url: String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var yearPublicacion :String = ""
    @State var descripcion : String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    
//    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
        //search
        
        HStack{
            
            Button(action: {
                
                watchGame(name: textoBusqueda)
                
                
                
                
            }, label: {
               
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                
                
                
            }).alert(isPresented: $isGameInfoEmpty){
                
                Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                
            }
            
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
        
        // endin search
        
        VStack{
            
            Text("LOS MAS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action:{
//                    url = urlVideos[0]
//                    print("URL: \(url)")
//
//                    isPlayerActive = true
                    watchGame(name: "The Witcher 3")

                    
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
//                        url = urlVideos[1]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        
                        watchGame(name: "Abzu")

                        
                    }, label: {
                        
                        Image("Abzu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    
                    Button(action: {
//                        url = urlVideos[2]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        
                        watchGame(name: "Crash Bandicoot")

                        
                    }, label: {
                        
                        Image("Crash Bandicoot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    Button(action: {
//                        url = urlVideos[3]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        watchGame(name: "DEATH STRANDING")

                        
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
//                        url = urlVideos[5]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        
                        watchGame(name: "Cuphead")

                        
                    }, label: {
                        
                        Image("Cuphead")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    Button(action: {
//                        url = urlVideos[5]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        
                        watchGame(name: "Hades")

                        
                    }, label: {
                        
                        Image("Hades")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                    
                    Button(action: {
//                        url = urlVideos[6]
//                        print("URL: \(url)")
//
//                        isPlayerActive = true
                        watchGame(name: "Grand Theft Auto V")
                        
                        
                    }, label: {
                        
                        Image("Grand Theft Auto V")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                        
                        
                    })
                    
                  
                    
                }
                
                
            }.padding(.bottom, 100)
            
            
            
            
        }
        
        
        
        
        
        NavigationLink(
            destination: GameView(url: url,
                                  titulo: titulo,
                                  studio: studio,
                                  calificacion: calificacion,
                                  yearPublicacion: yearPublicacion,
                                  descripcion: descripcion,
                                  tags: tags,
                                  imgsUrl: imgsUrl) ,
            
            isActive: $isGameViewActive,
            label: {
                
                EmptyView()
            })
        
        
        
    }

    func watchGame (name: String){
//        print("buscar juego \(name)")
//
//        isGameInfoEmpty = true;
        
        juegoEncontrado.search(gameName: name)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            
            
            print("cantidad e: \(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0  {
                
                isGameInfoEmpty = true
                
            }else{
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                yearPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages

                isGameViewActive = true
                
                
                
            }
            
        }
        
        
    }
    
//    func Busqueda(){
//
//        print("el usuario esta buscando \(textoBusqueda)")
//
//    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
