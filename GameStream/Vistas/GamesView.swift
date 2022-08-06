//
//  GamesView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 3/08/22.
//

import SwiftUI
import Kingfisher



struct GamesView: View {
    
    @ObservedObject var todosLosVideoJuegos =  ViewModel()
    
    
    @State var gameviewIsActive: Bool = false
    
    @State var url: String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var yearPublicacion :String = ""
    @State var descripcion : String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    
    let formaGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    
    var body: some View {
        
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                Text("Juegos")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top:16, leading: 0,
                                       bottom: 64,trailing: 0))
                
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        
                        
                        ForEach(todosLosVideoJuegos.gamesInfo, id: \.self ) {
                            
                            juego in
                            
                            Button(action: {
                                
                                
                                url = juego.videosUrls.mobile
                                
                                titulo =  juego.title
                                studio =  juego.studio
                                calificacion =  juego.contentRaiting
                                yearPublicacion =  juego.publicationYear
                                descripcion =  juego.description
                                tags =  juego.tags
                                imgsUrl =  juego.galleryImages
                                
                                print("puse el juego  \(titulo)")
                                
                                gameviewIsActive = true
                                
                                
                                
                            }, label: {
                                
                                KFImage(URL(string: juego.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle .init(cornerRadius: 4))
                                    .padding(.bottom , 12)
                                
                                
                                
                            })
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
            }.padding(.horizontal,6)
            
            
            NavigationLink(destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion,
                                     yearPublicacion: yearPublicacion, descripcion: descripcion,
                                     tags: tags, imgsUrl: imgsUrl),
                           isActive: $gameviewIsActive, label: {
                
                                EmptyView()
                            })
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    
//                    print("primer elemento de json: \(todosLosVideoJuegos.gamesInfo[0])")
                    
                    
              //      print("titulo del primer video juego  \(todosLosVideoJuegos.gamesInfo[0].title)")
                    
                }
            
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
