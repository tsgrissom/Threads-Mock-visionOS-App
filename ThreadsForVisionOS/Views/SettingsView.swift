import SwiftUI

struct SettingsPanelViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 140)
            .frame(maxWidth: 200)
            .fontWeight(.regular)
            .foregroundStyle(.white)
    }
}

struct SettingsOptionViewModifier: ViewModifier {
    let height: CGFloat
    
    init(height: CGFloat = 10) {
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.plain)
            .frame(height: height)
    }
}

struct SettingsPanelHeaderView: View {
    
    let title: String
    let initDividerWidth: CGFloat
    let dividerTapMultiplier: CGFloat
    
    @State var dividerWidth: CGFloat
    
    init(title: String, dividerWidth: CGFloat = 50, dividerTapMultiplier: CGFloat = 1.8) {
        self.title = title
        self.dividerWidth = dividerWidth
        self.initDividerWidth = dividerWidth
        self.dividerTapMultiplier = dividerTapMultiplier
    }
    
    func animateDividerWidth() {
        if dividerWidth != initDividerWidth {
            return
        }
        
        withAnimation {
            dividerWidth *= dividerTapMultiplier
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            withAnimation {
                dividerWidth = initDividerWidth
            }
        })
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 20))
                .bold()
            Divider()
                .overlay(.white)
                .frame(width: dividerWidth)
        }
        .foregroundStyle(.white)
        .onTapGesture {
            self.animateDividerWidth()
        }
    }
}

struct SettingsView: View {
    
    @State var isLoggedIn: Bool
    
    init(isLoggedIn: Bool = false) {
        self.isLoggedIn = isLoggedIn
    }
    
    var body: some View {
        ScrollView {
            topRow
            middleRow
            bottomRow
            Spacer()
        }
        .scrollClipDisabled(true)
        .scrollIndicators(.hidden)
        .padding([.leading], 5)
        .navigationTitle("App Settings")
    }
}

extension SettingsView {
    private var topRow: some View {
        let panelMod = SettingsPanelViewModifier()
        return HStack(spacing: 0) {
            appearancePanel
                .modifier(panelMod)
            behaviorPanel
                .modifier(panelMod)
            accessibilityPanel
                .modifier(panelMod)
        }
    }
    
    private var middleRow: some View {
        let panelMod = SettingsPanelViewModifier()
        return HStack(spacing: 0) {
            accountPanel
                .modifier(panelMod)
            privacyPanel
                .modifier(panelMod)
            notificationsPanel
                .modifier(panelMod)
        }
    }
    
    private var bottomRow: some View {
        let panelMod = SettingsPanelViewModifier()
        return HStack(spacing: 0) {
            helpPanel
                .modifier(panelMod)
            aboutPanel
                .modifier(panelMod)
        }
    }
    
    private var aboutPanelHeader: some View {
        SettingsPanelHeaderView(title: "About", dividerTapMultiplier: 1.15)
    }
    
    private var aboutPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            aboutPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("Privacy Policy")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("Terms of Use")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("Third Party Notices")
                }
                .modifier(optionMod)
            }
            .fontWeight(.regular)
        }
    }
    
    private var accessibilityPanelHeader: some View {
        SettingsPanelHeaderView(title: "Accessibility", dividerTapMultiplier: 2.2)
    }
    
    private var accessibilityPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            accessibilityPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
            }
        }
    }
    
    private var accountPanelHeader: some View {
        SettingsPanelHeaderView(title: "Account", dividerTapMultiplier: 1.5)
    }
    
    private var accountPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            accountPanelHeader
            VStack(alignment: .leading) {
                if isLoggedIn {
                    Button(action: {
                        self.isLoggedIn = false
                    }) {
                        Text("Log out")
                    }
                    .modifier(optionMod)
                } else {
                    Button(action: {
                        self.isLoggedIn = true
                    }) {
                        Text("Log in")
                    }
                    .modifier(optionMod)
                    
                    Button(action: {
                        self.isLoggedIn = true
                    }) {
                        Text("Create account")
                    }
                    .modifier(optionMod)
                }
            }
            .frame(height: 55)
        }
    }
    
    private var appearancePanelHeader: some View {
        SettingsPanelHeaderView(title: "Appearance", dividerTapMultiplier: 2.2)
    }
    
    private var appearancePanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            appearancePanelHeader
            VStack(alignment: .leading) {
                Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    Text("Dark mode")
                })
                .modifier(SettingsOptionViewModifier(height: 15))
                
                Button(action: {
                    
                }) {
                    Text("Theme options")
                }
                .modifier(optionMod)
            }
            .frame(height: 55)
            .frame(width: 200 * 0.8)
        }
    }
    
    private var behaviorPanelHeader: some View {
        SettingsPanelHeaderView(title: "Behavior", dividerTapMultiplier: 1.5)
    }
    
    private var behaviorPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            behaviorPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
            }
        }
    }
    
    private var notificationsPanelHeader: some View {
        SettingsPanelHeaderView(title: "Notifications", dividerTapMultiplier: 2.25)
    }
    
    private var notificationsPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            notificationsPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
            }
            .fontWeight(.regular)
        }
    }
    
    private var privacyPanelHeader: some View {
        SettingsPanelHeaderView(title: "Privacy", dividerTapMultiplier: 1.3)
    }
    
    private var privacyPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            privacyPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("An option")
                }
                .modifier(optionMod)
            }
        }
    }
    
    private var helpPanelHeader: some View {
        SettingsPanelHeaderView(title: "Help", dividerTapMultiplier: 1.15)
    }
    
    private var helpPanel: some View {
        let optionMod = SettingsOptionViewModifier()
        return VStack {
            helpPanelHeader
            VStack(alignment: .leading) {
                Button(action: {
                    
                }) {
                    Text("Report a problem")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("Help Center")
                }
                .modifier(optionMod)
                Button(action: {
                    
                }) {
                    Text("Support requests")
                }
                .modifier(optionMod)
            }
        }
    }
}

#Preview {
    ZStack {
        RoundedRectangle(cornerRadius: 30)
            .fill(.black.opacity(0.8))
        SettingsView()
    }
}

