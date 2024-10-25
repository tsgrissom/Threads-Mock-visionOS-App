import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            headerRow
            ScrollView {
                appearanceSection
            }
            .scrollIndicators(.hidden)
        }
        .foregroundColor(.black)
        .navigationTitle("App Settings")
    }
}

extension SettingsView {
    private var headerRow: some View {
        VStack {
            Text("App Settings")
                .font(.extraLargeTitle2)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Divider()
                .overlay(.black)
                .frame(width: 150)
        }
    }
    
    private var appearanceSection: some View {
        VStack {
            Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                Text("Dark mode")
            })
        }
        .frame(width: 300)
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.white.opacity(0.8))
        SettingsView()
    }
}

