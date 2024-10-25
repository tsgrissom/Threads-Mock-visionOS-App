import SwiftUI

struct SearchView: View {
    
    @State var searchTextField: String
    
    init(searchTextField: String = "") {
        self.searchTextField = searchTextField
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Threads...", text: $searchTextField)
                    .frame(width: 420)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }
            .padding(.leading, 35)
            
            HStack {
                ProfileListView()
                    .frame(width: 500)
                Spacer()
            }
        }
        .navigationTitle("Search")
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        SearchView()
            .foregroundStyle(.white)
    }
}

