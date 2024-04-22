//
//  Search filter.swift
//  AirBnb Clone
//
//  Created by Admin on 04/04/24.
//

import SwiftUI
enum filteroptions {
    case filter
    case dates
    case vehicles
}

struct Search_filter: View {
    @Binding var showexplore : Bool
    @ObservedObject var VM : ExploreVM
    @State private var filterresult = ""
    @State private var selectedoption : filteroptions = .filter
    @State private var startdate = Date()
    @State private var enddate = Date()
    @State private var numvehicles = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white,.green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment:.leading){
                HStack {
                    Button {
                        withAnimation(.bouncy){
                            VM.filterresults()
                            showexplore.toggle()
                        }
                    }label: {
                        Image(systemName: "xmark.circle")
                            .imageScale(.large)
                            .foregroundStyle(Color.accentColor) //white for dark mode
                            .padding()
                    }
                    Spacer()
                    if !VM.searchVehicle .isEmpty{
                        Button{
                            VM.searchVehicle = ""
                            VM.filterresults()
                        }label: {
                            Text("Clear")
                                .foregroundStyle(.black)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding()
                        }
                    }
                }
                VStack(alignment:.leading){
                    if selectedoption == .filter {
                        Text("Filter Your Results") // white for dark mode
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.accentColor)
                            TextField("Search in application", text : $VM.searchVehicle)
                                .foregroundStyle(Color.accentColor)
                                .onSubmit {
                                    VM.filterresults()
                                    showexplore.toggle()
                                }
                            
                        }
                        .frame(height: 45)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle())
                                .foregroundStyle(.gray)
                                .shadow(color : .black, radius: 5)
                        }
                    }
                    else {
                        exnpandableview(title: "Filter Results", description: "Tap to search")
                    }
                    
                }
                .padding()
                .frame(height: selectedoption == .filter ? 120 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedoption = .filter}
                }
                
                // date selection
                VStack{
                    if selectedoption == .dates {
                        Text("When are you planning to purchase ?")
                            .frame(width:250,height: 100)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .position(x:115,y:30)
                            .foregroundStyle(.red)
                        VStack{
                            DatePicker("From :\(startdate)", selection: $startdate, displayedComponents: .date)
                                .foregroundStyle(Color.accentColor)
                            Divider()
                            DatePicker("Till :\(enddate)", selection: $enddate, displayedComponents: .date)
                                .foregroundStyle(Color.accentColor)
                            
                        }
                    }
                    else {
                        exnpandableview(title: "Purchase date", description: "Select Date range")
                    }
                }
                .padding()
                .frame(height: selectedoption == .dates ? 200 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedoption = .dates}
                }
                
                
                
                //Number of vehicles
                VStack(alignment:.leading){
                    if selectedoption == .vehicles {
                        
                        Text("No. of Vehicles")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        
                        Stepper{
                            Text("\(numvehicles) Vehicles")
                                .foregroundStyle(.red)
                        }onIncrement: {
                            numvehicles += 1
                        }onDecrement: {
                            guard numvehicles > 0 else {return}
                            numvehicles -= 1
                        }
                        
                        
                    }
                    else {
                        exnpandableview(title: "Number of Vehicles", description: "Add Vehicles")
                    }
                }
                .frame(height: selectedoption == .vehicles ? 120 : 34)
                .modifier(filtermodifier())
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedoption = .vehicles}
                }
                VStack(alignment:.center){
                    Button(action: {
                        print("\(filterresult)")
                    }, label: {
                        Text("Search")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:100,height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .onTapGesture  {
                                VM.filterresults()
                                showexplore.toggle()
                            }
                    })
                }
                .padding(.horizontal,150)
                .padding(.top)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    Search_filter(showexplore: .constant(false), VM: ExploreVM(service: ExploreService()))
            .preferredColorScheme(.dark)
}

struct filtermodifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
        
    }
}

struct exnpandableview : View {
    let title : String
    let description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .foregroundStyle(Color.accentColor)
                    .font(.headline)
                    .fontWeight(.semibold)
                
            }
        }
    }
}
