//
//  Ingredient2Recipe.swift
//  CarteBlanche
//
//  Created by Sky on 2022/7/28.
//

import SwiftUI

struct Ingredient2Recipe: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        switch viewModel.ingredientView {
        case "Add":
            Ingredient2Recipe_Add(viewModel: viewModel)
        case "List":
            Ingredient2Recipe_List(viewModel: viewModel)
        case "Recipes":
            Ingredient2Recipe_Recipes(viewModel: viewModel)
        case "Home":
            Ingredient2Recipe_Home(viewModel: viewModel)
        default:
            Ingredient2Recipe_Home(viewModel: viewModel)
        }
    

    }
}

    
    
struct Ingredient2Recipe_Home: View {
    var viewModel: ViewModel
    var body: some View {
        VStack{
            Text("Ingredient2Recipe!")
            HStack{
                Button("Add Ingredients"){withAnimation(){viewModel.ingredientView = "Add"}}
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
                Button("Ingredients List"){withAnimation(){viewModel.ingredientView = "List"}}
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
                Button("Recipes"){withAnimation(){viewModel.ingredientView = "Recipes"}}
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
                Button("Back"){withAnimation(){viewModel.currentView = "Home"}}
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

struct Ingredient2Recipe_Add: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Select ingredients you wish to add:")
        Button("Banana"){viewModel.hasBanana.toggle()}
            .foregroundColor(viewModel.hasBanana ? Color.green : Color.red)
        Button("Flour"){viewModel.hasFlour.toggle()}
            .foregroundColor(viewModel.hasFlour ? Color.green : Color.red)
        Button("Roast Chicken"){viewModel.hasRoastChicken.toggle()}
            .foregroundColor(viewModel.hasRoastChicken ? Color.green : Color.red)
        Button("Tofu"){viewModel.hasTofu.toggle()}
            .foregroundColor(viewModel.hasTofu ? Color.green : Color.red)
        
        Button("Back"){withAnimation(){viewModel.ingredientView = "Home"}}
            
    }
}


struct Ingredient2Recipe_List: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Here are all of your currently selected ingredients:\n")
            .multilineTextAlignment(.center)
        if (viewModel.hasBanana){
            Text("🍌 Banana")
        }
        if (viewModel.hasFlour){
            Text("🌾 Flour")
        }
        if (viewModel.hasRoastChicken){
            Text("🍗 Roast Chicken")
        }
        if (viewModel.hasTofu){
            Text("🧈 Tofu")
        }
        Text("\n")
        Button("Back"){withAnimation(){viewModel.ingredientView = "Home"}}
            
    }
}


struct Ingredient2Recipe_Recipes: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("Here are some things you can make with your available ingredients:\n")
            .multilineTextAlignment(.center)
        
        if (viewModel.hasRoastChicken || viewModel.hasTofu){
            Text("You can make soup using your:")
            if (viewModel.hasRoastChicken){
                Text("🍗 Roast Chicken")
            }
            if (viewModel.hasTofu){
                Text("🧈 Tofu")
            }
        }
        
        if (viewModel.hasFlour && viewModel.hasBanana){
            Text("\nYou can make banana bread using your:")
            if (viewModel.hasBanana){
                Text("🍌 Banana")
            }
            if (viewModel.hasFlour){
                Text("🌾 Flour")
            }
        }
        
        if (viewModel.hasBanana){
            Text("\nYou can just eat your banana as is! 😋")
        }
        
        Text("\n")
        Button("Back"){withAnimation(){viewModel.ingredientView = "Home"}}
            
    }
}





//struct Ingredient2Recipe_Previews: PreviewProvider {
//    static var previews: some View {
//        Ingredient2Recipe()
//    }
//}
