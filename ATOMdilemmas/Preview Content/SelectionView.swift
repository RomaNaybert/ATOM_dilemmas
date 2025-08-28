//
//  SelectionView.swift
//  ATOMdilemmas
//
//  Created by Роман on 11.12.2024.
//

import SwiftUI

struct SelectionView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Задний план с кружками
                CircleBackgroundView()
                    .ignoresSafeArea()

                // Основное содержимое
                VStack(spacing: 20) {
                    // Приветствие
                    Text("Добро пожаловать!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                    
                    // Описание
                    Text("Выберите один из доступных режимов, чтобы начать своё путешествие в мир атомной науки!")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Карточки выбора режима
                    HStack(spacing: 20) {
                        // Экскурсия
                        NavigationLink(destination: ExcursionView()) {
                            ModeCardView(
                                title: "Экскурсия",
                                iconName: "map.fill",
                                backgroundColor: Color.blue.opacity(0.2)
                            )
                        }
                        
                        // Игра "Атомные дилеммы"
                        NavigationLink(destination: DilemmaView()) {
                            ModeCardView(
                                title: "Игра 'Атомные дилеммы'",
                                iconName: "puzzlepiece.fill",
                                backgroundColor: Color.green.opacity(0.2)
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Дополнительная информация
                    VStack(spacing: 10) {
                        Text("Не знаете, что выбрать?")
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Button(action: {
                            // Действие для кнопки
                            print("Открыть помощь")
                        }) {
                            Text("Посмотреть руководство")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 40)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct CircleBackgroundView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 300, height: 300)
                .position(x: 100, y: 10)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.3), Color.yellow.opacity(0.3)]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                ))
                .frame(width: 400, height: 400)
                .position(x: 500, y: 400)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.yellow.opacity(0.3)]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                ))
                .frame(width: 400, height: 400)
                .position(x: -100, y: 470)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.red.opacity(0.3), Color.orange.opacity(0.3)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .frame(width: 500, height: 500)
                .position(x: 250, y: 900)
        }
    }
}
struct ModeCardView: View {
    let title: String
    let iconName: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
//MARK: AtomDilemmas

import SwiftUI


    
    struct DilemmaView: View {
        @State private var isSheetPresented = false
        @State private var isSheetPresentedQuestion = false

        let imageName = "dilemma_image" // Название вашего изображения
        let sheetTitle = "Места для посещения:"
        let sheetDescription = """
        1. Атомный ледокольный флот (зал «Время первых»)
        2. СевМорПуть (зал «Современная атомная промышленность»)
        """

        var body: some View {
            ZStack {
                       // Фон (если нужно, можно убрать)
                       Color.white
                           .ignoresSafeArea()
                       
                VStack {
                    Spacer()
                    
                    // Изображение с градиентной рамкой
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20)) // Скругление самого изображения
                        .padding(10) // Внутренний отступ
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.red]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(25) // Скругление градиентной рамки
                        )
                        .padding(20) // Внешний отступ, чтобы рамка "дышала"
                        .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 10) // Тень
                    
                    Spacer()
                }
                
                VStack {
                    // Кнопка в правом верхнем углу
                    HStack {
                        Spacer()
                        Button(action: {
                            isSheetPresented = true
                        }) {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .clipShape(Circle())
                        }
                        Button(action: {
                            isSheetPresentedQuestion = true
                        }) {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    // Кнопка "Начать!"
//                    Button(action: {
//                        print("Начать!")
//                    }) {
//                        Text("Начать!")
//                            .font(.headline)
//                            .padding()
//                            .background(Color.blue.opacity(0.8))
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .padding(.horizontal, 20)
//                    }
//                    .padding(.bottom, 20)
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                SheetView(title: sheetTitle, description: sheetDescription)
            }
            .sheet(isPresented: $isSheetPresentedQuestion) {
                ExpertComingSheet()
            }
            .navigationBarHidden(true)
        }
    }
struct ExpertComingSheet: View {
    var body: some View {
        VStack(spacing: 20) {
            // Иконка
            Image(systemName: "person.crop.circle.badge.checkmark")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)

            // Сообщение
            Text("Скоро к вам подойдет эксперт!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(.horizontal, 20)

            Spacer()

            // Кнопка закрытия
            Button(action: {
                // Закрытие sheet
            }) {
                Text("Хорошо")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .cornerRadius(15)
                    )
                    .padding(.horizontal, 20)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.3), radius: 15, x: 0, y: 5)
            .ignoresSafeArea()
        )
    }
}
struct SheetView: View {
    let imageName = "map_image" // Название вашего изображения

    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 20) {
            // Заголовок
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .cornerRadius(10)
                )
                .padding(.horizontal)

            // Описание
            Text(description)
                .font(.body)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding()
                .background(
                    Color.gray.opacity(0.1)
                        .cornerRadius(10)
                )
                .padding(.horizontal)

//            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20)) // Скругление самого изображения
                .padding(10) // Внутренний отступ
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.red]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .cornerRadius(25) // Скругление градиентной рамки
                )
                .padding(20) // Внешний отступ, чтобы рамка "дышала"
                .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 10) // Тень
            // Кнопка закрытия
            Spacer()
            Button(action: {
                // Закрытие sheet происходит автоматически
            }) {
                Text("Закрыть")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.orange]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(10)
                    )
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .padding(.top, 20)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.3), radius: 15, x: 0, y: 5)
    }
}

//MARK: ExcurtionsView

import SwiftUI
import RealityKit

struct ExcursionView: View {
    @State private var scannedCode: String?
    @State private var show3DSheet = false
    @State private var showQR = false

    
    var body: some View {
        VStack(spacing: 20) {
            // Заголовок
            Text("Экскурсия")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 40)
            
            Spacer()
            
            // Карта помещения
            Image("map_image") // Замените на изображение карты
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 20)
            
            Spacer()
            
            // Кнопки
            HStack(spacing: 20) {
                Button(action: {
                    // Открыть 3D модель
                    show3DSheet = true
                }) {
                    ButtonView(title: "Показать 3D модель", iconName: "cube.fill")
                }
                
                Button(action: {
                    showQR = true
                    print("Сканировать QR-код")
                }) {
                    ButtonView(title: "Сканировать QR-код", iconName: "qrcode.viewfinder")
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.white)
        .sheet(isPresented: $show3DSheet) {
            Model3DSheet()
        }
        .sheet(isPresented: $showQR) {
            QRCodeScannerView { scannedCode in
                self.scannedCode = scannedCode
                self.showQR = false
            }
        }
        .navigationBarHidden(true)
    }
}
import SwiftUI
import AVFoundation

struct QRCodeScannerView: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        var parent: QRCodeScannerView
        
        init(parent: QRCodeScannerView) {
            self.parent = parent
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            guard let metadataObject = metadataObjects.first else { return }
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            
            parent.didFindCode(stringValue)
        }
    }
    
    var didFindCode: (String) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> QRCodeScannerViewController {
        let scannerVC = QRCodeScannerViewController()
        scannerVC.didFindCode = didFindCode
        return scannerVC
    }
    
    func updateUIViewController(_ uiViewController: QRCodeScannerViewController, context: Context) {}
}
import UIKit
import AVFoundation

class QRCodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var resultPopup: UIAlertController?
    
    var didFindCode: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupCamera()
    }
    
    private func setupCamera() {
        captureSession = AVCaptureSession()
        
        guard let captureSession = captureSession else { return }
        
        let videoCaptureDevice = AVCaptureDevice.default(for: .video)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
        } catch {
            print("Error while accessing camera.")
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            print("Cannot add input.")
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            print("Cannot add output.")
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.frame = view.layer.bounds
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession?.stopRunning()
        
        guard let metadataObject = metadataObjects.first else { return }
        
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
        guard let stringValue = readableObject.stringValue else { return }
        
        showResultPopup(with: stringValue)
    }
    
    private func showResultPopup(with message: String) {
        resultPopup = UIAlertController(title: "Информация об экспонате", message: message, preferredStyle: .alert)
        resultPopup?.addAction(UIAlertAction(title: "Понял!", style: .default, handler: { _ in
            self.captureSession?.startRunning()
        }))
        
        present(resultPopup!, animated: true)
    }
}

struct Model3DSheet: View {
    var body: some View {
        VStack {
            Text("3D модель экспоната")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.top, 20)
            
            Spacer()
            
            // 3D модель
            SceneKitView(modelName: "Crystal_atom_cage.usdz")
                .frame(height: 300)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                .padding()
            
            // Описание модели
            Text("Это уменьшенная версия модели. Вы можете вращать модель, увеличивать и уменьшать её масштаб.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            // Кнопка закрытия
            Button(action: {
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
            }) {
                Text("Закрыть")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
        .background(Color.white)
    }
}

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    var modelName: String

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        
        // Создание сцены
        let scene = SCNScene(named: modelName)
        sceneView.scene = scene

        // Настройка свойств SCNView
        sceneView.allowsCameraControl = true // Позволяет пользователю вращать модель
        sceneView.showsStatistics = false // Показывать статистику (по желанию)
//        sceneView.backgroundColor = UIColor.white // Изменение цвета фона на темный
        
        // Добавление света для лучшего отображения модели
        let light = SCNLight()
        light.type = .omni
        light.color = UIColor.white
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 0, y: 5, z: 0) // Позиция света
        scene?.rootNode.addChildNode(lightNode)

        // Добавление дополнительного источника света
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
//        ambientLight.color = UIColor(white: 1.0, alpha: 0.5) // Полупрозрачный свет
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene?.rootNode.addChildNode(ambientLightNode)

        // Добавление камеры
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 1, z: 5) // Поднимите камеру выше
        cameraNode.look(at: SCNVector3(0, 0, 0)) // Направляем камеру на центр
        scene?.rootNode.addChildNode(cameraNode)

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // Обновление UI View, если это необходимо
    }
}



struct ButtonView: View {
    let title: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.white)
            Text(title)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

struct PopupView: View {
    @Binding var qrData: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("QR-код найден!")
                .font(.headline)
                .foregroundColor(.blue)
            
            Text(qrData)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Button(action: {
                isPresented = false
            }) {
                Text("Закрыть")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
#Preview {
    Model3DSheet()
//    SheetView(title: "Места для посещения:", description: "1. Атомный ледокольный флот (зал «Время первых»)\n2. СевМорПуть (зал «Современная атомная промышленность»)"
//    )
}
