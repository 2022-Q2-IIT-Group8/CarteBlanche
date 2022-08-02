//
//  ContentView.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            switch viewModel.currentView {
            case "Ingredient2Recipe":
                Ingredient2Recipe(viewModel: viewModel)
            case "RecycleMap":
                RecycleMap(viewModel: viewModel)
            case "RecycleCalendar":
                RecycleCalendar(viewModel: viewModel)
            case "Feedback":
                Feedback(viewModel: viewModel)
            case "Home":
                Home(viewModel: viewModel)
            default:
                BadState()
            }
            
            
        }
    }
}

struct Home: View {
    var viewModel: ViewModel


    var body: some View {
        VStack{
            Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                .resizable()
                .frame(width: 64, height: 64)
                            
            Text("Gomi\n")
                .font(.title)
            HStack{
                Button("Ingredients to Recipe Finder!"){
                    withAnimation(){
                        viewModel.currentView = "Ingredient2Recipe"}
                }
                    .frame(width: viewModel.frameSize, height: viewModel.frameSize)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .background(Color.gray)
                    .cornerRadius(25)
                Button("Recycling Map!"){
                    withAnimation(){
                        viewModel.currentView = "RecycleMap"
                    }
                }
                    .frame(width: viewModel.frameSize, height: viewModel.frameSize)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .background(Color.gray)
                    .cornerRadius(25)
            }
            HStack{
                Button("Council Bin Calendar!"){
                    withAnimation(){
                        viewModel.currentView = "RecycleCalendar"
                        
                    }
                }
                    .frame(width: viewModel.frameSize, height: viewModel.frameSize)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .background(Color.gray)
                    .cornerRadius(25)
                Button("Beta: Send your Feedback!"){
                    withAnimation(){
                        viewModel.currentView = "Feedback"
                    }
                }
                    .frame(width: viewModel.frameSize, height: viewModel.frameSize)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .background(Color.gray)
                    .cornerRadius(25)
            }
            
            
        }
    }
}

struct BadState: View {
    var body: some View {
        Text("Whoops! Looks like someonne shouldn't be storing state in a string like a total noob!")
        Text("Couldn't you be bothered using enums for heavens sake?")
        Text("NAH JUST A PROTOTYPE, WE CAN FUDGE IT FOR NOW")
    }
}






struct Feedback: View {
    var viewModel: ViewModel
    @State private var username: String = "Feedback: "
    @State private var showingAlert = false
    @State var submitString = "Submit"
    @State var submitColor = Color.blue


    var body: some View{
        Text("Please enter your feedback below:")
            .multilineTextAlignment(.center)
        TextEditor(text: $username)
            .foregroundColor(.secondary)
            .padding(.horizontal)
               
                      
        Button(submitString){
            submitString = "Sending..."
            submitColor = Color.gray
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(){
                    showingAlert = true
                }
            }
        }
        .font(.system(size: 18))
        .padding()
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 2)
        )
        .background(submitColor)
        .cornerRadius(25)
        .padding(12)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Feedback Received"), message: Text("Thank you for your feedback!"), dismissButton: .default(Text("Back to Home Screen")){withAnimation(){viewModel.currentView = "Home"}})
        }

        
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
