//
//  ContentView.swift
//  HomeWork1
//
//  Created by User06 on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSecondView = false
    
    @State private var MyMoney = 10000
    @State private var bet = 0
    @State private var chip_value = [10, 50, 100, 500, 1000]
    @State private var chip_name = ["chip10", "chip50", "chip100", "chip500", "chip1000"]
    @State private var chip_now = -1
    @State private var last_chip_image = [Int](repeating: 0, count: 50)
    @State private var number = -1
    @State private var frame_total_value = [Int](repeating: 0, count: 50)
    
    let NumberColor = ["G","R","B","R","B","R","B","R","B","R","B","B","R"      // 0, 1-12
                          ,"B","R","B","R","B","R","R","B","R","B","R","B"      //    13-24
                          ,"R","B","R","B","B","R","B","R","B","R","B","R","G"  //    25-36, 37
                          ,"G","G","G"                                          //    38-40
                          ,"G","G","G"                                          //    41-43
                          ,"G","G","R","B","G","G"]                             //    44-49
    
    let TWELVE = ["1st TWELVE", "2nd TWELVE", "3rd TWELVE"]                     //    41-43
    let HALF_odds = ["1-18", "even", "red", "black", "odd", "19-36"]
    
    func Calculate(){
        if(frame_total_value[number] >= 1){
            MyMoney += chip_value[0] * 36// * chip_flag[number]
        }
        if(frame_total_value[38] >= 1 && number % 3 == 1 && number != 37){
            MyMoney += frame_total_value[38] * 3// * chip_flag[38]
        }
        if(frame_total_value[39] >= 1 && number % 3 == 2){
            MyMoney += frame_total_value[39] * 3// * chip_flag[39]
        }
        if(frame_total_value[40] >= 1 && number % 3 == 0 && number != 0){
            MyMoney += frame_total_value[40] * 3// * chip_flag[40]
        }
        if(frame_total_value[41] >= 1 && number >= 1 && number <= 12){
            MyMoney += frame_total_value[41] * 3// * chip_flag[41]
        }
        if(frame_total_value[42] >= 1 && number >= 13 && number <= 24){
            MyMoney += frame_total_value[42] * 3// * chip_flag[42]
        }
        if(frame_total_value[43] >= 1 && number >= 25 && number <= 36){
            MyMoney += frame_total_value[43] * 3// * chip_flag[43]
        }
        if(frame_total_value[44] >= 1 && number >= 1 && number <= 18){
            MyMoney += frame_total_value[44] * 2// * chip_flag[44]
        }
        if(frame_total_value[45] >= 1 && number != 0 && number % 2 == 0){
            MyMoney += frame_total_value[45] * 2// * chip_flag[45]
        }
        if(frame_total_value[46] >= 1 && NumberColor[number] == "R"){
            MyMoney += frame_total_value[46] * 2// * chip_flag[46]
        }
        if(frame_total_value[47] >= 1 && NumberColor[number] == "B"){
            MyMoney += frame_total_value[47] * 2// * chip_flag[47]
        }
        if(frame_total_value[48] >= 1 && number != 37 && number % 2 == 1){
            MyMoney += frame_total_value[48] * 2
        }
        if(frame_total_value[49] >= 1 && number >= 19 && number <= 36){
            MyMoney += frame_total_value[49] * 2// * chip_flag[49]
        }
        frame_total_value = [Int](repeating: 0, count: 50)
        if(MyMoney <= 0){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                MyMoney = 10000
                showSecondView = true
            }
        }
    }
    
    var body: some View {
        
        VStack(spacing : 0){
            Text("My Money : \(MyMoney)")
                .font(.title)
                .foregroundColor(Color.black)
            HStack(alignment: .center, spacing : 0){
                VStack(alignment: .center, spacing : 0){ // 0  00
                    ZStack{
                        Text("0")  //index:0
                            .font(.title)
                            .frame(width: 50, height: 75, alignment: .center)
                            .foregroundColor(Color.black)
                            .background(Color.green)
                            .border(Color.black, width: 1.5)
                            .onTapGesture {
                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                    frame_total_value[0] += chip_value[chip_now]
                                    bet += chip_value[chip_now]
                                    MyMoney -= chip_value[chip_now]
                                    last_chip_image[0] = chip_now
                                }
                            }
                        if (frame_total_value[0] >= 1){
                            Image(chip_name[last_chip_image[0]])
                                .resizable()
                                .frame(width: 45, height: 45, alignment: .center)
                                .clipShape(Circle())
                            /*Text("\(frame_total_value[0])")
                                .foregroundColor(Color.black)*/
                        }
                    }
                
                    ZStack{
                        Text("00") //index:37
                            .font(.title)
                            .frame(width: 50, height: 75, alignment: .center)
                            .foregroundColor(Color.black)
                            .background(Color.green)
                            .border(Color.black, width: 1.5)
                            .onTapGesture {
                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                    frame_total_value[37] += chip_value[chip_now]
                                    bet += chip_value[chip_now]
                                    MyMoney -= chip_value[chip_now]
                                    last_chip_image[37] = chip_now
                                }
                            }
                        if (frame_total_value[37] >= 1){
                            Image(chip_name[last_chip_image[37]])
                                .resizable()
                                .frame(width: 45, height: 45, alignment: .center)
                                .clipShape(Circle())
                            /*Text("\(frame_total_value[37])")
                                .foregroundColor(Color.black)*/
                        }
                    }
                }
                HStack(alignment: .center, spacing:0){ //1-36
                    ForEach(0...11, id: \.self){ i in
                        VStack(alignment: .center, spacing:0){
                            ForEach(3*i+1...3*i+3, id: \.self){ index in
                                if NumberColor[index] == "R"{
                                    ZStack{
                                        Text(String(index))
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .background(Color.red)
                                            .border(Color.black, width: 1.5)
                                            .onTapGesture {
                                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                                    frame_total_value[index] += chip_value[chip_now]
                                                    bet += chip_value[chip_now]
                                                    MyMoney -= chip_value[chip_now]
                                                    last_chip_image[index] = chip_now
                                                }
                                            }
                                        if(frame_total_value[index] >= 1){
                                            Image(chip_name[last_chip_image[index]])
                                                .resizable()
                                                .frame(width: 45, height: 45, alignment: .center)
                                                .clipShape(Circle())
                                            /*Text("\(frame_total_value[index])")
                                                .foregroundColor(Color.black)*/
                                        }
                                    }
                                }
                                else{
                                    ZStack{
                                        Text(String(index))
                                            .font(.title)
                                            .foregroundColor(Color.white)
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .background(Color.black)
                                            .border(Color.black, width: 1.5)
                                            .onTapGesture {
                                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                                    frame_total_value[index] += chip_value[chip_now]
                                                    bet += chip_value[chip_now]
                                                    MyMoney -= chip_value[chip_now]
                                                    last_chip_image[index] = chip_now
                                                }
                                            }
                                        if(frame_total_value[index] >= 1){
                                            Image(chip_name[last_chip_image[index]])
                                                .resizable()
                                                .frame(width: 45, height: 45, alignment: .center)
                                                .clipShape(Circle())
                                            /*Text("\(frame_total_value[index])")
                                                .foregroundColor(Color.black)*/
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                VStack(alignment: .center, spacing:0){ // index:38 39 40 2to1
                    ForEach(38...40, id: \.self){ index in
                        ZStack{
                            Text("2\nTo 1")
                                //.font(.title)
                                .foregroundColor(Color.black)
                                .frame(width: 50, height: 50, alignment: .center)
                                .background(Color.green)
                                .border(Color.black, width: 1.5)
                                .onTapGesture {
                                    if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                        frame_total_value[index] += chip_value[chip_now]
                                        bet += chip_value[chip_now]
                                        MyMoney -= chip_value[chip_now]
                                        last_chip_image[index] = chip_now
                                    }
                                }
                            if(frame_total_value[index] >= 1){
                                Image(chip_name[last_chip_image[index]])
                                    .resizable()
                                    .frame(width: 45, height: 45, alignment: .center)
                                    .clipShape(Circle())
                                /*Text("\(frame_total_value[index])")
                                    .foregroundColor(Color.black)*/
                            }
                        }
                    }
                }
            }
            HStack(alignment: .center, spacing:0){ // index: 41 42 43
                ForEach(41...43, id: \.self){ index in
                    ZStack{
                        Text(TWELVE[index-41])
                            .font(.title)
                            .foregroundColor(Color.black)
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color.green)
                            .border(Color.black, width: 1.5)
                            .onTapGesture {
                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                    frame_total_value[index] += chip_value[chip_now]
                                    bet += chip_value[chip_now]
                                    MyMoney -= chip_value[chip_now]
                                    last_chip_image[index] = chip_now
                                }
                            }
                        if(frame_total_value[index] >= 1){
                            Image(chip_name[last_chip_image[index]])
                                .resizable()
                                .frame(width: 45, height: 45, alignment: .center)
                                .clipShape(Circle())
                            /*Text("\(frame_total_value[index])")
                                .foregroundColor(Color.black)*/
                        }
                    }
                }
            }
            HStack(alignment: .center, spacing:0){ // index: 44 45 46 47 48 49
                ForEach(44...49, id: \.self){ index in
                    ZStack{
                        Text(HALF_odds[index-44])
                            .font(.title)
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 50, alignment: .center)
                            .background(Color.green)  // 46:R 47:B
                            .border(Color.black, width: 1.5)
                            .onTapGesture{
                                if((chip_now == 0 && MyMoney >= 10) || (chip_now == 1 && MyMoney >= 50) || (chip_now == 2 && MyMoney >= 100) || (chip_now == 3 && MyMoney >= 500) || (chip_now == 4 && MyMoney >= 1000)){
                                    frame_total_value[index] += chip_value[chip_now]
                                    bet += chip_value[chip_now]
                                    MyMoney -= chip_value[chip_now]
                                    last_chip_image[index] = chip_now
                                }   
                            }
                        if(frame_total_value[index] >= 1){
                            Image(chip_name[last_chip_image[index]])
                                .resizable()
                                .frame(width: 45, height: 45, alignment: .center)
                                .clipShape(Circle())
                            /*Text("\(frame_total_value[index])")
                                .foregroundColor(Color.black)*/
                        }
                    }
                }
            }
            HStack(alignment: .center, spacing:0){
                Button {
                    bet = 0
                    number = Int.random(in: 0...37)
                    Calculate()
                } label: {
                    Image("SpinButtom")
                        .resizable()
                        .frame(width: 150, height: 75, alignment: .center)
                }.sheet(isPresented: $showSecondView){
                    SecondView(showSecondView: $showSecondView)
                }
                /*
                Image("SpinButtom")
                    .resizable()
                    .frame(width: 150, height: 75, alignment: .center)
                    .onTapGesture {
                        bet = 0
                        number = Int.random(in: 0...37)
                        Calculate()
                    }.sheet(isPresented: $showSecondView){
                        SecondView()
                    }*/
                /*NavigationLink(destination: SecondView(), isActive: $showSecondView){
                    SecondView()
                }*/
                Image("chip10")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        //frame_total_value[0] = 0
                        chip_now = 0
                    }
                Image("chip50")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .onTapGesture {
                        chip_now = 1
                    }
                Image("chip100")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        chip_now = 2
                    }
                Image("chip500")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .onTapGesture {
                        chip_now = 3
                    }
                Image("chip1000")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                    .onTapGesture {
                        chip_now = 4
                    }
                VStack(alignment: .center, spacing:0){
                    Text("total bet : \(bet)")
                        .font(.title)
                        .foregroundColor(Color.black)
                    Text("number : \(number)")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

struct SecondView: View{
    @Binding var showSecondView: Bool
    
    var body: some View{
        VStack{
            Text("YOU LOSE")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            Text("TRY AGAIN")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
                .onTapGesture {
                    showSecondView = false
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 852, height: 393))
    }
}
