//
//  EditProfileView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 13/08/22.
//

import SwiftUI

struct EditProfileView: View {
   
    var body: some View {
       
        
        
        ZStack {
            
            
            ScrollView{
                
                VStack{
                    
                    
                    Button(action: {} , label: {
                        
                        ZStack{
                            
                            Image("perfilejmeplo").resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                            
                        }
                       
                        
                        
                        
                        
                    })
                    
                }.padding(.bottom, 18.0)
                
                ModuloEditar
                
            }
          

        }.background(Color("Marine"))
            .ignoresSafeArea()
        
        
        
        
    }
}


struct  ModuloEditar : View {
    
    
    var body: some View{
        
        Text("Modulo Editar")
        
    }
    
}


struct EditProfileView_Previews: PreviewProvider {
  
    static var previews: some View {
        EditProfileView()
    }
    
}
