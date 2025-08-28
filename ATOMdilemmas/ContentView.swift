import SwiftUI

struct RegistrationView: View {
    @State private var firstName = "Roma"
    @State private var lastName = "Naypert"
    @State private var roomNumber = "12"
    @State private var age = "16"
    @State private var isButtonDisabled = true
    @State private var showThis = false
    @State private var previewCardTitle = "Предварительное название карточки"
    
    var body: some View {
        ZStack {
            // Анимированный фон
            AnimatedBackground()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Заголовок
                Text("Добро пожаловать в 'Атомные дилеммы'!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.horizontal, 20)
                
                // Инструкция
                Text("Заполните все поля, чтобы продолжить.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // Поля ввода
                VStack(spacing: 16) {
                    TextField("Имя", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Фамилия", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Номер команды", text: $roomNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    TextField("Возраст", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .onChange(of: age) { _ in updateCardPreview() }
                }
                .padding(.horizontal, 20)
                
                // Превью карточки
                VStack(spacing: 10) {
                    Text("Ваша карточка будет:")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .lineLimit(20)
                    
                    Text(previewCardTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Кнопка продолжить
                Button(action: {
                    showThis = true
                }) {
                    Text("Продолжить")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isButtonDisabled ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .fullScreenCover(isPresented: $showThis) {
                    SelectionView()
                }
                .disabled(isButtonDisabled)
                .onChange(of: [firstName, lastName, roomNumber, age]) { _ in
                    isButtonDisabled = firstName.isEmpty || lastName.isEmpty || roomNumber.isEmpty || age.isEmpty
                }
            }
            .padding(.bottom, 40)
            .onTapGesture {
                // Скрыть клавиатуру при нажатии на фон
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
    
    // Обновление предварительного просмотра карточки
    private func updateCardPreview() {
        if let ageInt = Int(age) {
            switch ageInt {
            case 0..<12:
                previewCardTitle = "Использование ядерных технологий для электроэнергии vs риск аварий"
            case 12..<13:
                previewCardTitle = "Ядерные исследования для медицины vs создание оружия"
            case 13..<14:
                previewCardTitle = "Эксперт атомной промышленности"
            default:
                previewCardTitle = "инвестирование в развитие атомного ледокольного флота рф vs глобальное изменение климата"
            }
        } else {
            previewCardTitle = "инвестирование в развитие атомного ледокольного флота рф vs глобальное изменение климата"
        }
    }
}

struct AnimatedBackground: View {
    @State private var animate = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<6, id: \.self) { i in
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: geometry.size.width * 0.5 + CGFloat(i * 50),
                               height: geometry.size.width * 0.5 + CGFloat(i * 50))
                        .offset(x: animate ? CGFloat(i * 30) : -CGFloat(i * 30),
                                y: animate ? -CGFloat(i * 20) : CGFloat(i * 20))
                        .blur(radius: 30)
                        .animation(
                            Animation.easeInOut(duration: 8).repeatForever(autoreverses: true),
                            value: animate
                        )
                }
            }
            .onAppear {
                animate.toggle()
            }
        }
    }
}

#Preview {
    RegistrationView()
}

