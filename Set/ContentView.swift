//
//  ContentView.swift
//  Set
//
//  Created by Treata Norouzi on 9/30/22.
//

import SwiftUI

struct ContentView: View {
    
    var letters = ["A", "B", "C", "D", "E"]
    
    var numbers = [1, 3, 5, 7]
    
    @State var lettersCount = 1
    var shapes = [Oval(), Rhombus()] as [Any]
    
    var body: some View {
//
//        AspectVGrid(items: numbers, aspectRatio: 1.618) {numbers in Rectangle().opacity(2)
//        }
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 10000))])
        {ForEach(letters, id: \.self) {letter in CardView(content: letter).aspectRatio(1/1.618, contentMode: .fit)}
        }
        .foregroundColor(.red)
        .padding(5)
    }
}

struct Deck: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct CardView: View {
    var content: String
    
    var body: some View {
        ZStack {
            Squiggle().strokeBorder(lineWidth: 2.6)
            Text(content).font(.largeTitle).foregroundColor(.black)
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


