//
//  ContentView.swift
//  FlippablePostCard
//
//  Created by OmerErbalta on 16.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingComment = false
    @State private var degrees: Double = 0.0
    @State private var isFlipped: Bool = false
   @State private var dragDirection: DragDirection = .none
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body: some View {
        
        VStack{
            ZStack {
                //Image
                VStack{
                    
                       Image("swiftLogo")
                            .resizable()
                            .frame(width:width * 0.95,height:height * 0.35)
                            .scaledToFill()
                    
                    
                }.opacity(isFlipped ? 0.0 : 1.0)
                
                //Caption
                VStack{
                    HStack {
                       
                            Text("Omer_Erbalta :  ")
                                .fontWeight(.bold)
                                .font(.subheadline)
                            +  Text("Swift is a fast, secure, and user-friendly programming language developed by Apple. It's particularly ideal for developing applications on iOS and other Apple platforms. Known for its type safety and modern features, Swift also stands out as an open-source language, encouraging community involvement")
                       
                         
                        Spacer()
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding()
                }
                .opacity(isFlipped ? 1.0 : 0.0)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }
            .rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .gesture(DragGesture().onChanged({ value in
                let direction: DragDirection = value.translation.width > 0 ? .right : .left
                if dragDirection != direction{
                    withAnimation{
                        dragDirection = direction
                        degrees += dragDirection == .left ? -180:180
                        isFlipped.toggle()
                    }
                }
        }))
        }
    }
}

#Preview {
    ContentView()
}
enum DragDirection {
    case none
    case right
    case left
}
