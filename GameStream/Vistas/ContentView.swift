//
//  ContentView.swift
//  Shared
//
//  Created by SBSCO3 on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            
            
            ZStack {
                Spacer()
                Color( red: 19/255, green: 30/255, blue: 53/255, opacity: 1).ignoresSafeArea()
                VStack{
                    Image("appLogo").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding( .bottom, 42 )
                    
                    InicioYRegistroView()
                }
                
                
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle()) // this line is for full screen in ipad
    }
}

struct InicioYRegistroView:View {
    
    @State var tipoInicioSession: Bool   = true
    
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Spacer()
                
                Button ("INICIA SESSION") {
                    print("iniciar session")
                    tipoInicioSession=true;
                }
                .foregroundColor(tipoInicioSession ? .white : .gray)
                
                
                Spacer()
                
                Button ("REGISTRATE") {
                    print("REGISTRATE")
                    tipoInicioSession=false;
                    
                }
                
                .foregroundColor(tipoInicioSession ? .gray : .white)
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSession == true{
                InicioSessionView()
                
            }else{
                
                RegistroView()
                
            }
        }
        
    }
}


struct  InicioSessionView: View {
    
    @State var correo = ""
    
    @State var passwords = ""
    @State var isPantallaHomeActive = false
    @State  var showalert: Bool = false
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                
                Text("Correo Electronico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                    
                    
                    
                    
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                
                Text("Password")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if passwords.isEmpty{
                        
                        Text("Escribe tu password")
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    
                    SecureField("", text: $passwords)
                        .foregroundColor(.white)

                    
                    
                    
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Olvidaste tu password?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                Button (action: iniciarSession,label: {
                    Text("INICIAR SESION")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"),
                                    lineWidth: 3.0
                                   ).shadow(color: .white,
                                            radius: 6))
                    
                        
                    //.frame(width: .infinity, height: 100, alignment: .center)
                }).alert( isPresented: $showalert, content: {
                    Alert(title: Text("Error"), message: Text("No se encontró nigún usuario o la contraseña es incorrecta"), dismissButton: .default(Text("Entendido")))})

                Text("Inicia sesion con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .padding(EdgeInsets(top: 31, leading: 18, bottom: 11, trailing: 18))
                HStack {
                   
                    
                    Button(action: iniciarSessionFacebook,label:{
                        
                        Text("Facebook").foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 1.0
                                       )
                                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("blue-gray")/*@END_MENU_TOKEN@*/))
                        
                    })
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("blue-gray")/*@END_MENU_TOKEN@*/)
                    
                    Spacer()

                    Button(action: iniciarSessionTwitter,label:{
                      
                        Text("Twitter").foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius:8.0)
                                .stroke(
                                        lineWidth: 1.0
                                )
                                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("blue-gray")/*@END_MENU_TOKEN@*/))
                    })
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("blue-gray")/*@END_MENU_TOKEN@*/)
                    
                    
                    
                }
                
            }.padding(.horizontal, 42.0)
            
            
            NavigationLink(
            destination: Home(),
            isActive: $isPantallaHomeActive,
            label: {
                
                EmptyView()
            })
            
        }
        
        
        
        
        
    }
    
    
    func iniciarSession(){
        
        let objetoDatosUsuario = SaveData()
        
        print("Mi correo es \(correo)  y mi password es \(passwords) ")
        
        
        if objetoDatosUsuario.validar(correo: correo, password: passwords){
            
            showalert = false
            isPantallaHomeActive = true
            print("Estoy Iniciando sesion")
        
        }else{
            
           // isPantallaHomeActive = true
          isPantallaHomeActive = false

          //  isPantallaHomeActive.toggle()
                       print("Tus datos son incorrectos")
           showalert = true
            
           
                
           
          
        }
        
     
    }
}


struct  RegistroView: View {
    @State var correo = ""
    
    @State var passwords = ""
    @State var Confirmepasswords = ""
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center){
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o legirla mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom,10)
                
                Button(action: tomarFoto, label: {
                    
                    
                    ZStack{
                        Image("perfilejemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            
                        Image(systemName:"camera")
                            .foregroundColor(.white)
                        
                        
                    }
                    
                })
                .padding(.bottom,10)
                
            
            }
                
  

            VStack (alignment: .leading) {

                
                VStack (alignment: .leading){
                    Text("Correo Electronico*")
                        .foregroundColor(Color("Dark-Cian"))
                        .frame(width: 300,  alignment: .leading)

                ZStack(alignment: .leading){

                    if correo.isEmpty{

                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }



                    TextField("", text: $correo)
                        .foregroundColor(.white)




                }


                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)

                Text("Password*")
                    .foregroundColor(.white)

                ZStack(alignment: .leading){

                    if passwords.isEmpty{

                        Text("escribe tu password")
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }



                    SecureField("", text: $passwords)
                        .foregroundColor(.white)




                }


                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)

                Text("Confirmar Password*")
                    .foregroundColor(.white)

                ZStack(alignment: .leading){

                    if Confirmepasswords.isEmpty{

                        Text("Vuelve a escribir tu password")
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }



                    SecureField("", text: $Confirmepasswords)
                        .foregroundColor(.white)




                }


                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
              
            }

                Button (action: registrate,label: {
                    Text("REGISTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"),
                                    lineWidth: 3.0
                                   ).shadow(color: .white,
                                            radius: 6))


                    //.frame(width: .infinity, height: 100, alignment: .center)
                })

                Text("Registrate con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .padding(EdgeInsets(top: 31, leading: 18, bottom: 11, trailing: 18))
                HStack {


                    Button(action: iniciarSessionFacebook,label:{

                        Text("Facebook").foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .padding(.vertical, 3.0)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))

                    })
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("blue-gray")/*@END_MENU_TOKEN@*/)

                    Spacer()

                    Button(action: iniciarSessionTwitter,label:{

                        Text("Twitter").foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .padding(.vertical, 3.0)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("blue-gray")/*@END_MENU_TOKEN@*/)



                }

            }.padding(.horizontal, 77.0)
            
        }
        
    }
    
    
    func registrate(){
        
        print("Estoy registratandome")
        
        if passwords == Confirmepasswords {
            
            let objetoActualizadorDatos = SaveData()
            
            let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, password: passwords, nombre: "")
            
            
            print("se guardaron los datos con exito?:\(resultado)")
            
            
        }else{
            
            print("Pasword diferentes, vuele a intentarlo")

        }
        
        
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        Image("pantalla02").resizable()
        
        ContentView()
        
        
    }
}

// funcs



func iniciarSessionTwitter(){
    
    print("Estoy Iniciando sesion Twitter")
}

func iniciarSessionFacebook(){
    
    print("Estoy Iniciando sesion Facebook")
}

func tomarFoto(){
    
    print("Voy a tomar foto")

    
}



