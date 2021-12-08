//
//  MainPage.swift
//  UI-386
//
//  Created by nyannyan0328 on 2021/12/07.
//

import SwiftUI

struct MainPage: View {
    @StateObject var model = HomeViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack{
                
                
                HStack{
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                    
                    
                    TextField("", text: .constant(""))
                    
                    
                }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(
                
                Capsule()
                    .strokeBorder(.gray,lineWidth: 3)
                
                )
                .frame(width: getRect().width / 1.6)
                
                
                Text("Order Online\nCollection in Strore")
                    .font(.largeTitle.weight(.black))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.leading,8)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    HStack{
                        
                        
                        ForEach(ProductType.allCases,id:\.self){type in
                            
                            
                          
                            Button {
                                withAnimation{
                                    
                                    model.currentType = type
                                }
                            } label: {
                                
                                Text(type.rawValue)
                                    .font(.title3.weight(.light))
                                    .foregroundColor(model.currentType == type ? .black : .gray)
                                    .padding(.bottom,13)
                                    .overlay(
                                    
                                        ZStack{
                                            
                                            if model.currentType == type{
                                                
                                                
                                                Capsule()
                                                    .fill(Color.black)
                                                    .frame(height: 3)
                                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                            }
                                               
                                               else{
                                                   
                                                   Capsule()
                                                       .fill(Color.clear)
                                                       .frame(height: 3)
                                                   
                                                   
                                               }
                                        }
                                            .padding(.horizontal,-9)
                                            
                                           
                                        
                                        ,alignment:.bottom
                                    
                                    
                                    )
                                
                            }

                              
                                
                           
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.top,20)
                
                
                productView()
                
                
              
                
                
            }
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("HomeBG").ignoresSafeArea())
        .onChange(of: model.currentType) { V in
            
            model.filterProductByType()
        }
    }
    @ViewBuilder
    func productView()->some View{
        
        
      
        ScrollView(.horizontal, showsIndicators: false) {
            VStack{
                
            HStack(spacing:20){
                    
                    ForEach(model.fileterProduct){pro in
                       
                        VStack{
                            
                        
                                
                                Image(pro.productImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                
                                .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
                                .offset(y: -80)
                                .padding(.bottom,-80)
                            
                            
                            
                            Text(pro.title)
                                .font(.title.weight(.bold))
                            
                            Text(pro.subtitle)
                                .font(.title.weight(.bold))
                            
                            
                            Text(pro.price)
                                .font(.title.weight(.bold))
                        }
                        .padding(.horizontal)
                        .padding(.bottom,20)
                        .background(Color.white.cornerRadius(10))
                    
                        
                      
                           
                    }
                    
                }
            .padding(.top,80)
           
              
                
            }
  
            
            
        }
        
        
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
