//
//  ProfileView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 13/08/22.
//

import SwiftUI

struct ProfileView: View {
   
    @State var  nombreusuario = "Lorem"
    
    @State var imagenPerfil: UIImage = UIImage(named: "perfilejemplo")!
    
    
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

//                Image(uiImage: imagenPerfil)
//                    .foregroundColor(Color.white)
//                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
//                    .padding(.top,60)

                VStack{
                
                    
                    Image(uiImage: imagenPerfil).resizable()
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
                
                //Metodo imagen perfil
                if returnUiImage(named: "fotoperfil") != nil {
                    
                    imagenPerfil = returnUiImage(named: "fotoperfil")!
                    
                }else{
                    
                    print("No encontre foto de perfil guardada en el dispositivo")

                }
                
                
                
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
    
    
    
    func returnUiImage(named:String) -> UIImage? {
        
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                                  appropriateFor: nil, create: false){
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
            
            
          return nil
            
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
