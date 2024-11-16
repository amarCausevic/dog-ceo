import SwiftUI
import LoremSwiftum

struct BreedDetailsView: View {
    @StateObject private var breedDetailsModelView = BreedDetailsViewModel()
    let dog: DogTypeListModel
    
    var body: some View {
        VStack {
            VStack {
                if let url = breedDetailsModelView.breadImage?.message {
                    AsyncImage(url: URL(string: url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Text("Invalid URL")
                }
                Text (dog.breed).textCase(.uppercase).font(.title)
                Text(Lorem.sentences(5))
            }
            .padding()
            Spacer()
        }
        .onAppear {
            print("Deatils page:  \(dog.breed)")
            breedDetailsModelView.getBreedRandomImage(breedName: dog.breed)
        }
        .padding()
    }
}
