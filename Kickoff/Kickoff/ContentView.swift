//
//  ContentView.swift
//  Kickoff
//
//  Created by Jordan Singer on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Window()
        .frame(minWidth: 720, idealWidth: 720, maxWidth: 960, maxHeight: .infinity)
    }
}

struct Window: View {
    var body: some View {
        HStack(spacing: 0) {
            Chat()
                .frame(width: 320)
            Divider()
            Tasks()
        }
    }
}

struct Chat: View {
    @State var message = ""
    @State var messages = [
        "Here’s to the crazy ones",
        "the misfits, the rebels, the troublemakers",
        "the round pegs in the square holes…",
        "the ones who see things differently — they’re not fond of rules…",
        "You can quote them, disagree with them, glorify or vilify them",
        "but the only thing you can’t do is ignore them because they change things…",
        "they push the human race forward",
        "and while some may see them as the crazy ones",
        "we see genius",
        "because the ones who are crazy enough to think that they can change the world",
        "are the ones who do."
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<messages.count, id: \.self) { i in
                        ChatBubbleView(message: messages[i], index: i)
                    }
                }
                .padding()
            }
            Divider()
            
            HStack(spacing: 12) {
                ZStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                        .offset(x: 0, y: 1)
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(NSColor.black.withAlphaComponent(0.64)))
                }
                .font(.system(size: 18))
                
                TextField("Message", text: $message, onCommit: { self.sendMessage() })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ZStack {
                    Image(systemName: "arrowtriangle.left.square")
                        .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                        .offset(x: 0, y: 1)
                    Image(systemName: "arrowtriangle.left.square")
                        .foregroundColor(Color(NSColor.black.withAlphaComponent(0.64)))
                }
                .font(.system(size: 18))
            }
            .padding(12)
            .background(EffectsView(material: NSVisualEffectView.Material.menu, blendingMode: NSVisualEffectView.BlendingMode.withinWindow))
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#ECEFF6"), Color(hex: "#E3E7F2")]), startPoint: .top, endPoint: .bottom))
    }
    
    func sendMessage() {
        self.messages.append(self.message)
        self.message = ""
    }
}

struct Tasks: View {
    @State private var selection = 0
    @State var tasks = [
        "Missing @2x icons",
        "UI internationalization",
        "Implement touch events",
        "Push notifications for tasks",
        "Unit testing",
        "App store graphics"
    ]
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(0..<tasks.count, id: \.self) { i in
                            Task(task: tasks[i])
                        }
                    }
                    .padding()
                }
                
                Divider()
                
                HStack(spacing: 12) {
                    ZStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                            .offset(x: 0, y: 1)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(NSColor.black.withAlphaComponent(0.64)))
                    }
                    .font(.system(size: 18))
                    
                    Spacer()
                    
                    Picker(selection: $selection, label: EmptyView()) {
                        Text("Everyone").tag(0)
                        Text("Me").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 128)
                    
                    Spacer()
                    
                    ZStack {
                        Image(systemName: "plus")
                            .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                            .offset(x: 0, y: 1)
                        Image(systemName: "plus")
                            .foregroundColor(Color(NSColor.black.withAlphaComponent(0.64)))
                    }
                    .font(.system(size: 18))
                }
                .padding(12)
                .background(EffectsView(material: NSVisualEffectView.Material.menu, blendingMode: NSVisualEffectView.BlendingMode.withinWindow))
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#DBDEE5"), Color(hex: "#C9CED7")]), startPoint: .top, endPoint: .bottom))
        .navigationTitle("Team")
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "sidebar.left")
                }
            }
        }
    }
}

struct Task: View {
    var task: String
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "circle")
                    .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                    .offset(x: 0, y: 1)
                Image(systemName: "circle")
                    .foregroundColor(Color(NSColor.black.withAlphaComponent(0.24)))
            }
            .font(.system(size: 16, weight: .medium))
            
            ZStack {
                Text(task)
                    .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                    .offset(x: 0, y: 1)
                Text(task)
                    .foregroundColor(Color(NSColor.black))
            }
            
            Spacer()
            
            ZStack {
                Image(systemName: "bubble.left")
                    .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                    .offset(x: 0, y: 1)
                Image(systemName: "bubble.left")
                    .foregroundColor(Color(NSColor.black.withAlphaComponent(0.24)))
            }
            .font(.system(size: 12, weight: .medium))
            
            Avatar()
        }
        .padding(.vertical)
        .padding(.leading)
        .padding(.trailing, 8)
        .frame(height: 40)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#FFFFFF"), Color(hex: "#E6E8ED")]), startPoint: .top, endPoint: .bottom)
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(NSColor.black.withAlphaComponent(0.32)), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: Color(NSColor.black.withAlphaComponent(0.12)), radius: 2, x: 0, y: 1)
        )
    }
}

struct ChatBubbleView: View {
    @State var message: String
    @State var index: Int
    var outgoingBubbleColor = NSColor.systemBlue
    var outgoingBubbleTopGradientColor = "#E9F1FD"
    var outgoingBubbleBottomGradientColor = "#C6E1FC"
    var incomingBubbleTopGradientColor = "#FEFEFF"
    var incomingBubbleBottomGradientColor = "#EFF1F7"
    var incomingBubbleColor = NSColor.windowBackgroundColor
    var incomingLabelColor = NSColor.labelColor
    
    var body: some View {
        HStack(alignment: .bottom) {
            if index % 2 != 0 {
                Spacer()
            } else {
                Avatar()
                    .padding(.bottom, 3)
            }
            
            ZStack {
                Text(message)
                    .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                    .offset(x: 0, y: 1)
                Text(message)
                    .foregroundColor(Color(NSColor.black))
            }
                .foregroundColor(Color(index % 2 != 0 ? .white : incomingLabelColor))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex: index % 2 != 0 ? outgoingBubbleTopGradientColor : incomingBubbleTopGradientColor), Color(hex: index % 2 != 0 ? outgoingBubbleBottomGradientColor : incomingBubbleBottomGradientColor)]), startPoint: .top, endPoint: .bottom)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(Color(NSColor.black.withAlphaComponent(0.24)), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .shadow(color: Color(NSColor.black.withAlphaComponent(0.12)), radius: 2, x: 0, y: 1)
                )
            
            if index % 2 == 0 {
                Spacer()
            } else {
                Avatar()
            }
        }
    }
}

struct Avatar: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .frame(width: 24, height: 24)
                .foregroundColor(Color(hex: "#E6E7ED"))
            
            ZStack {
                Image(systemName: "person.fill")
                    .foregroundColor(Color(NSColor.white.withAlphaComponent(0.48)))
                    .offset(x: 0, y: 1)
                Image(systemName: "person.fill")
                    .foregroundColor(Color(NSColor.black.withAlphaComponent(0.24)))
            }
            .font(.system(size: 14, weight: .medium))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .stroke(Color(NSColor.black.withAlphaComponent(0.12)), lineWidth: 1)
        )
    }
}

// blur effect
struct EffectsView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

// hex color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
