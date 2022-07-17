//
//  ContentView.swift
//  Shared
//
//  Created by SBSCO3 on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            
          
        }
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
    
    var body: some View {
        
        ScrollView {
            
            VStack (alignment: .leading) {
                
                
                Text("Correo Electronico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                    }
               
                        
                    
                    TextField("", text: $correo)
                    
                    
                    
                    
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
                    
                    
                    
                    
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Olvidaste tu password?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                
                
                
            }.padding(.horizontal, 77.0)
            
        }
       
        
        
        
        
    }
}


struct  RegistroView: View {
    
    var body: some View {
        
        Text("Soy la vista de RegistroView")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        Image("pantalla01").resizable()

        ContentView()
        
        
    }
}
