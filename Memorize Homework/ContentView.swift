//
//  ContentView.swift
//  Memorize Homework
//
//  Created by Cruz Gonzalez Garcia on 9/8/21.
//

import SwiftUI


struct ContentView: View {
    @State var emojis = ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"]
    
    @State var emojiCount = 6
    
    var body: some View {
       
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.largeTitle)
                    
                    .foregroundColor(.black)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    
                    ForEach(emojis[0..<emojiCount], id:\.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(3/5, contentMode: .fit)
                    })
                }
            }
            
            
            .foregroundColor(.red)
            
            Spacer()
            
            
            //MARK: HW
            HStack {
                
                Spacer()
                
                VStack {
                    Vehichles
                }
                
                Spacer()
                
                VStack {
                    Nature
                }
                
                Spacer()
                
                VStack {
                    Weather
                }
                
                Spacer()
            
            }
            
        }
        .padding(.horizontal)
    }

//    var remove : some View {
//        //remove button
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//
//        }, label: {
//            VStack{
//                Image(systemName: "minus.circle")
//            }
//        })
//    }
//
//
//    var add : some View {
//        //add  button
//        Button(action: {
//            if emojiCount < emojis.count{
//                emojiCount += 1
//            }
//        }, label: {
//            VStack{
//                Image(systemName: "plus.circle")
//            }
//        })
//    }
    

    
    // MARK: This is responsible for the Vechicles theme
    let vehiclesArr = ["🚕", "✈️", "🚜", "🚒", "🛳", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉"]
    var Vehichles : some View {
        Button(action: {
            
            emojiCount = Int.random(in: 4..<vehiclesArr.count)
            emojis = vehiclesArr.shuffled()
            
        }, label: {
            VStack{
                Image(systemName: "car.fill")
                    .font(.largeTitle)
                Text("Vehicles")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
            }
        })
    }
    
    // MARK: This is is reponsible for the nature theme
    let nature = ["🌱", "🌿", "☘️", "🍀", "🎍", "🪴", "🎋", "🌴", "🪵", "🌾", "💐", "🌷", "🌹", "🌺", "🌸", "🌻" ]
    var Nature : some View  {
        Button(action: {
            
            emojiCount = Int.random(in: 4..<nature.count)
            emojis = nature.shuffled()
            
        }, label: {
            VStack{
                Image(systemName: "leaf")
                    .font(.largeTitle)
                Text("Nature")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
            }
        })
    }
    
    
    // MARK: This is responsible for the weather theme
    var weather = ["☀️", "🌤", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨", "❄️", "☔️", "☂️", "🌪", "⚡️"]
    var Weather : some View  {
        Button(action: {
            
            emojiCount = Int.random(in: 4..<weather.count)
            emojis = weather.shuffled()
        }, label: {
            VStack{
                Image(systemName: "cloud.sun.fill")
                    .font(.largeTitle)
                Text("Weather")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
            }
        })
    }
}



struct CardView: View {
    @State var isFaceUp = true
    
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                    
                Text(content)
                    .font(.largeTitle)
                
            } else {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill()
            }
        }
        
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
    
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
