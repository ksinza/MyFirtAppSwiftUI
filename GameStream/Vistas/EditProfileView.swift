//
//  EditProfileView.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 13/08/22.
//

import SwiftUI

struct EditProfileView: View {
   
    @State var imagenPerfil: Image? = Image("perfilejemplo")
    
    @State var isCameraActive = false
    
    var body: some View {
       
        
        
        ZStack {
            Color("Marine").ignoresSafeArea()

            
            ScrollView {
                
                VStack(alignment: .center){
                    
                    
                    
                    Button(action: {
                        
                        isCameraActive = true
                        
                        
                    } , label: {
                        
                        ZStack{
                            
                                imagenPerfil!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive, content: {
                                    
                                    SUImagePickerView(sourceType: .photoLibrary, image:  self.$imagenPerfil, isPresented: $isCameraActive)

                                    
                                })
                            
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                            
                        }
                       
                        
                        
                        
                        
                    })
                    
                }.padding(.bottom, 18.0)
                
                ModuloEditar()
                
            }
          

        }
        
        
        
        
    }
}


struct  ModuloEditar : View {
    
    @State var correo:String = ""
    
    @State var password:String = ""
    
    @State var nombre: String = ""
    
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("Correo Electronico")
                .foregroundColor(Color( "Dark-Cian"))
                .font(.title3)
                .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                
                
                if correo.isEmpty {
                    
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                    
                }
                
                TextField("", text: $correo)
                    .foregroundColor(.white)

            }

            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
            
            
            Text("Password")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)

            ZStack(alignment: .leading){
                
                
                if password.isEmpty {
                    
                    Text("Introduce tu password")
                        .font(.caption)
                        .foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                    
                }
                
                SecureField("", text: $password)
                    .foregroundColor(.white)
            }

            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
            
            
            
//            nombre
            
            Text("Nombre")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)
            
            ZStack(alignment: .leading){
                
                
                if nombre.isEmpty {
                    
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                    
                }
                
                TextField("", text: $nombre)
                    .foregroundColor(.white)

            }

            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32)
            
            Button(action: {actualizarDatos()},
                   label: {
                
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity , alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Dark-Cian"),
                                lineWidth: 3).shadow(color: .white, radius: 3))
                
            }).padding(.bottom)
            
            
            
            
        }.padding(.horizontal, 42.0)
        
    }
    
    func actualizarDatos(){
        
        
        let objetoActualizadorDatos = SaveData()
        
        let resultado =  objetoActualizadorDatos.guardarDatos(correo: correo, password: password, nombre: nombre) // resultado de guardar datos
        
        
        print("Se guardaron los datos con exito?\(resultado)" )
        
    }
    
}


struct EditProfileView_Previews: PreviewProvider {
  
    static var previews: some View {
        EditProfileView()
    }
    
}
