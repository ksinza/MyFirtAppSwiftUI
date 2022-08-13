//
//  FavoritesView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 13/08/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    
    var body: some View {
        
        
        ZStack{
            
           // Color("Marine")
            Spacer()
            Spacer()
            VStack {
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9.0)
                
                
                ScrollView{
                    
                    
                    ForEach (todosLosVideojuegos.gamesInfo, id: \.self){
                        
                        juego in
                        
                        VStack(spacing: 0){
                            
                            
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame( height: 300)
                            
                            Text("\(juego.title)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity,  alignment: .leading)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle (cornerRadius: 3.0))
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                }.padding(.bottom, 8)
                   
                
                
                
                

            }.padding(.horizontal, 6)
               
                .background(Color("Marine"))
            
            
            
            

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
        
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
