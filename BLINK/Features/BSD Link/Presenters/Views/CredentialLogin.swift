//
//  CredentialLogin.swift
//  BLINK
//
//  Created by yuri wardana on 29/06/23.

import Foundation
import SwiftUI
import AuthenticationServices

//test


struct CredentialLogin : View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var appData = ApplicationData()
    @StateObject var appManager : AppManager = AppManager()
    @StateObject var sheetManager : SheetManager = SheetManager()
    //    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults <Item>
    
    
    @AppStorage ("email") var email: String = ""//cahce property wrapper
    @AppStorage ("firstName") var firstName: String = ""//cahce property wrapper
    @AppStorage ("lastName") var lastName: String = ""//cahce property wrapper
    @AppStorage ("userId") var userId: String = ""//cahce property wrapper
    @State private var isLogged: Bool = false
    
    var body: some View{
        
        //if ada first nama
        
        
        
        if(firstName == ""){
        NavigationView {
            VStack{
                Text("image should be here")
                //tar masukin gambar disini pake zstack
                Spacer()
                
                VStack{
                    if(!isLogged){
                        SignInWithAppleButton(.signIn) { request in
                            
                            request.requestedScopes = [.email , .fullName]
                            print("\(String(describing: request.user))")
                        } onCompletion: { result in
                            
                            switch result{
                            case .success(let auth):
                                
                                switch auth.credential {
                                case let credentialData as ASAuthorizationAppleIDCredential:
                                    
                                    let userId = credentialData.user//user id
                                    
                                    let email = credentialData.email//user info
                                    let firstName = credentialData.fullName?.givenName
                                    let lastName = credentialData.fullName?.familyName
                                    //                                print(firstName)
                                    
                                    self.email = email ?? ""
                                    self.userId = userId
                                    self.firstName = firstName ?? ""
                                    self.lastName = lastName ?? ""
                                    //save ke user default
                                    isLogged = true
                                
                                    
                                default:
                                    break
                                }
                                
                            case .failure(let error):
                                print(error)
                            }
                            
                        }
                        
                        .signInWithAppleButtonStyle(
                            colorScheme == .dark ? .white : .black
                        )
                    }
                    }
                .cornerRadius(10)
                .frame(height: 50)
                .padding(.bottom, 50)
                
                }
            }
        .padding()
        }
        //else homepage
        else{
            HomePage(firstName:firstName)
                .environment(\.managedObjectContext,appData.container.viewContext)
                .environmentObject(appData)
                .environmentObject(sheetManager)
                .environmentObject(appManager)
            
    }
    }
}
            
            struct CredentialLogin_Previews: PreviewProvider {
                static var previews: some View {
                    CredentialLogin()
                }
            }
