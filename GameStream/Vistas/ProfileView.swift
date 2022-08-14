//
//  ProfileView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 13/08/22.
//

import SwiftUI

struct ProfileView: View {
   
    @State var  nombreusuario = "Lorem"
    
    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding(.top,60)

                VStack{
                
                    
                    Image("perfilejemplo").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                   
                    Text(nombreusuario)
                        .fontWeight(.bold)

                    .foregroundColor(Color.white)
                   
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)

                ModuloAjustes()
                
                Spacer()
                Spacer()
            }.ignoresSafeArea()
            
            
        }

        .onAppear(
        
            perform: {
                
                
                print("revisando si tengo datos de usuario es mis UserDefaults")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreusuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    
                    print("nombre de usuario es \(nombreusuario)")

                    
                }else{
                    
                    print(" no encontre nombre de usuario")

                    
                }
                
            }
            
        )
       
      
      
        
        
        
        
        
    }
    
    
    
}


struct ModuloAjustes: View{
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    
    
    var body: some View {
        
        VStack (spacing: 3){
            
            
            Button (action: {}, label: {
                
                HStack{
                    
                    Text("Cuenta").foregroundColor(.white)
                    
                    Spacer()
                    Text(">").foregroundColor(.white)
                    
                }.padding()
               
                
                
            })
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle (cornerRadius: 1.0))
           
            
            Button (action: {}, label: {
                
                HStack{
                    
                    Text("Notificaciones").foregroundColor(.white)
                    
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
               
                
                
            })
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle (cornerRadius: 1.0))
           
            Button (action: {
                
                isEditProfileViewActive = true
                
                
            }, label: {
                
                HStack{
                    
                    Text("Editar Perfil").foregroundColor(.white)
                    
                    Spacer()
                    Text(">").foregroundColor(.white)
                    
                }.padding()
               
                
                
            })
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle (cornerRadius: 1.0))
            
            
            Button (action: {}, label: {
                
                HStack{
                    
                    Text("Califica esta aplicacion").foregroundColor(.white)
                    
                    Spacer()
                    Text(">").foregroundColor(.white)
                    
                }.padding()
               
                
                
            })
            .background(Color("blue-gray"))
            .clipShape(RoundedRectangle (cornerRadius: 1.0))
           
            
            NavigationLink(destination: EditProfileView(),
                           isActive: $isEditProfileViewActive,
                           label: {
                                EmptyView()
                            })
            
            
        }
        
    }
    
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
