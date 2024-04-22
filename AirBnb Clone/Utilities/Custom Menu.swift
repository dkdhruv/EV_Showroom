import SwiftUI

struct Custom_Menu: View {
    
    @State var isMenuOpen = false
    
    var body: some View {
        ZStack {
            
            ZStack {
                Circle()
                    .frame(width: 38, height: 38)
                    .foregroundColor(.white)
                
                Image(systemName: "pencil.circle")
                    .foregroundColor(.blue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
            }
            .displayOnMenuOpen(isMenuOpen, offset: -150)
            
            ZStack {
                Circle()
                    .frame(width: 38, height: 38)
                    .foregroundColor(.white)
                
                Image(systemName: "message.circle")
                    .foregroundColor(.blue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
            }
            .displayOnMenuOpen(isMenuOpen, offset: -100)
            
            ZStack {
                Circle()
                    .frame(width: 38, height: 38)
                    .foregroundColor(.white)
                
                Image(systemName: "person.circle")
                    .foregroundColor(.blue)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                
            }
            .displayOnMenuOpen(isMenuOpen, offset: -50)
            
            ZStack {
                Circle()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.blue)
                
                Image(systemName: isMenuOpen ? "x.circle" : "plus.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .animation(.easeInOut(duration: 0.3), value: isMenuOpen)
            }
            .onTapGesture {
                isMenuOpen.toggle()
            }
        }
    }
}
 
struct DisplayOnOpenMenuViewModifier: ViewModifier {
    
    let isOpened: Bool
    let offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(isOpened ? 0.1 : 0.0), radius: 10, x: 0, y: 5)
            .offset(y: isOpened ? offset : 0)
            .opacity(isOpened ? 100 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: isOpened)
    }
}
 
extension View {
    func displayOnMenuOpen(_ isOpened: Bool, offset: CGFloat) -> some View {
        modifier(DisplayOnOpenMenuViewModifier(isOpened: isOpened, offset: offset))
    }
}

#Preview {
    Custom_Menu()
}





//VStack {
//    Picker("Select Payment Mode",selection: $option) {
//        Button(
//            action : Paytm,
//            label :{
//                HStack{
//                    Text("PayTm")
//                    Image(systemName: "bitcoinsign.circle")
//                    
//                }
//            }
//        )
//        Button(
//            action : Paytm,
//            label :{
//                HStack{
//                    Text("NEFT")
//                    Image(systemName: "bitcoinsign.circle")
//                    
//                }
//            }
//        )
//    }
//    .pickerStyle(MenuPickerStyle())
//    
//    Text("Selected Mode :\(option)")
//}
