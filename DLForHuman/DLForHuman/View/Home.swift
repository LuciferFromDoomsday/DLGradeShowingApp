import SwiftUI


  

struct Home : View {
    @State var show = false
    @State var search = ""
      @State var index = 0
      @State var curvePos : CGFloat = 0
    @Binding var share : FetchUser
   
      var body: some View{
       
          ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
           
         
            
            HStack(spacing: 15){
                              
                              if show{
                                  
                                  // Search Bar...
                                  
                                if #available(iOS 14.0, *) {
                                    TextField("Search Gradient", text: $search)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        // search Bar Functionality...
                                        
                                        .onChange(of: search) { (value) in
                                            
                                            if search != ""{
                                                
                                                // searchColor()
                                            }
                                            else{
                                                
                                                // clearing all search results..
                                                
                                                search = ""
                                                //filtered = gradients
                                                
                                            }
                                        }
                                } else {
                                    // Fallback on earlier versions
                                }
                              }
            }
              // Tab Bar...
              
              HStack{
                  
                  // using it for reading curve position....
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 0
                                  self.curvePos = g.frame(in: .global).midX
                              }
                              
                          }, label: {
                              
                              Image("home")
                                  .renderingMode(.template)
                                  .resizable()
                                  .foregroundColor(index == 0 ? .yellow : .gray)
                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                              // animating View...
                                  .background(Color.white.opacity(index == 0 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 0 ? -35 : 0)
                          })
                      }
                      // 28 + padding 15 = 43....
                      .frame(width: 43, height: 43)
                      .onAppear {
                          
                          // getting initial index position...
                          
                          DispatchQueue.main.async {
                              
                              self.curvePos = g.frame(in: .global).midX
                          }
                      }
                  }
                  .frame(width: 43, height: 43)
                  
                  Spacer(minLength: 0)
                  
                  GeometryReader{g in
                      
                      VStack{
                          
                          Button(action: {
                              
                              withAnimation(.spring()){
                                  
                                  index = 1
                                  // assigning it whenever its button is clicked...
                                  
                                  self.curvePos = g.frame(in: .global).midX
                              }
                              
                          }, label: {
                              
                              Image("calculator")
                                  .renderingMode(.template)
                                  .resizable()
                                  .foregroundColor(index == 1 ? .black : .gray)
                                  .frame(width: 28, height: 28)
                                  .padding(.all, 15)
                                  .background(Color.white.opacity(index == 1 ? 1 : 0).clipShape(Circle()))
                                  .offset(y: index == 1 ? -35 : 0)
                          })
                      }
                      // 28 + padding 15 = 43....
                      .frame(width: 43, height: 43)
                  }
                  .frame(width: 43, height: 43)
                  
                  Spacer(minLength: 0)
                GeometryReader{g in
                                     
                                     VStack{
                                         
                                         Button(action: {
                                             
                                             withAnimation(.spring()){
                                                 
                                                 index = 2
                                                 self.curvePos = g.frame(in: .global).midX
                                             }
                                             
                                         }, label: {
                                             
                                             Image("news")
                                                 .renderingMode(.template)
                                                 .resizable()
                                                 .foregroundColor(index == 2 ? .black : .gray)
                                                 .frame(width: 28, height: 28)
                                                 .padding(.all, 15)
                                                 .background(Color.white.opacity(index == 2 ? 1 : 0).clipShape(Circle()))
                                                 .offset(y: index == 2 ? -35 : 0)
                                         })
                                     }
                                     // 28 + padding 15 = 43....
                                     .frame(width: 43, height: 43)
                                 }
                                 .frame(width: 43, height: 43)
                                 
                                 Spacer(minLength: 0)
                                 
                GeometryReader{g in
                                     
                                     VStack{
                                         
                                         Button(action: {
                                             
                                             withAnimation(.spring()){
                                                 
                                                 index = 3
                                                 self.curvePos = g.frame(in: .global).midX
                                             }
                                             
                                         }, label: {
                                             
                                             Image("settings")
                                                 .renderingMode(.template)
                                                 .resizable()
                                                 .foregroundColor(index == 3 ? .black : .gray)
                                                 .frame(width: 28, height: 28)
                                                 .padding(.all, 15)
                                                 .background(Color.white.opacity(index == 3 ? 1 : 0).clipShape(Circle()))
                                                 .offset(y: index == 3 ? -35 : 0)
                                         })
                                     }
                                     // 28 + padding 15 = 43....
                                     .frame(width: 43, height: 43)
                                 }
                                 .frame(width: 43, height: 43)
                                 
                                 Spacer(minLength: 0)
                                 
                
                  
         }
              .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
              .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 8 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
              .padding(.top, 8)
              .background(Color.white.clipShape(CShape(curvePos: curvePos)))
              
              // going to add Curve...
          })
          .edgesIgnoringSafeArea(.all)
      }
  }
  
 
struct CShape : Shape {

   
    
    var curvePos : CGFloat
    
   var animatableData: CGFloat{
        
        get{return curvePos}
        set{curvePos = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
     
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            // adding Curve...
            
            path.move(to: CGPoint(x: curvePos + 40, y: 0))
            
            path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0), control: CGPoint(x: curvePos, y: 70))
            // using this we can control curve length....
        }
        
    }
}


 
                
