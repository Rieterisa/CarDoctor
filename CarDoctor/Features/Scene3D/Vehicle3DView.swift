import SwiftUI
import RealityKit
import UIKit

struct Vehicle3DView: View {
    let highlightedEntity: String
    let partName: String

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                CarSceneRepresentable(highlightedEntityName: highlightedEntity)
                    .ignoresSafeArea(edges: .bottom)

                VStack(alignment: .leading, spacing: 6) {
                    Text(String(localized: "scene3d.title"))
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.8))
                    Text(partName)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(.white)
                }
                .padding(16)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .padding()
            }

            Text(String(localized: "scene3d.hint"))
                .font(.footnote)
                .foregroundStyle(AppTheme.muted)
                .padding()
        }
        .background(AppTheme.canvas.ignoresSafeArea())
        .navigationTitle(String(localized: "scene3d.nav"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// Procedural low-poly car with named parts — no external USDZ required for MVP.
struct CarSceneRepresentable: UIViewRepresentable {
    let highlightedEntityName: String

    func makeUIView(context: Context) -> ARView {
        let view = ARView(frame: .zero)
        view.cameraMode = .nonAR
        view.environment.background = .color(.init(red: 0.08, green: 0.11, blue: 0.14, alpha: 1))

        let anchor = AnchorEntity(world: .zero)
        let car = ProceduralCarBuilder.makeCar(highlight: highlightedEntityName)
        car.position = SIMD3(0, -0.15, 0)
        anchor.addChild(car)

        let camera = PerspectiveCamera()
        camera.camera.fieldOfViewInDegrees = 45
        let cameraAnchor = AnchorEntity(world: .zero)
        cameraAnchor.position = SIMD3(0.9, 0.55, 1.4)
        cameraAnchor.look(at: SIMD3(0, 0.1, 0), from: cameraAnchor.position, relativeTo: nil)
        cameraAnchor.addChild(camera)

        view.scene.addAnchor(anchor)
        view.scene.addAnchor(cameraAnchor)

        // Gentle orbit via timer in coordinator.
        context.coordinator.car = car
        context.coordinator.startOrbit()

        let pan = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        view.addGestureRecognizer(pan)

        return view
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        context.coordinator.applyHighlight(named: highlightedEntityName)
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        var car: Entity?
        private var timer: Timer?
        private var angle: Float = 0.4

        func startOrbit() {
            timer = Timer.scheduledTimer(withTimeInterval: 1 / 30, repeats: true) { [weak self] _ in
                guard let self, let car else { return }
                self.angle += 0.004
                car.orientation = simd_quatf(angle: self.angle, axis: SIMD3(0, 1, 0))
            }
        }

        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            let t = gesture.translation(in: gesture.view)
            angle += Float(t.x) * 0.005
            gesture.setTranslation(.zero, in: gesture.view)
            car?.orientation = simd_quatf(angle: angle, axis: SIMD3(0, 1, 0))
        }

        func applyHighlight(named name: String) {
            guard let car else { return }
            ProceduralCarBuilder.applyHighlight(on: car, name: name)
        }

        deinit { timer?.invalidate() }
    }
}

enum ProceduralCarBuilder {
    static let partNames = [
        "engine", "o2_sensor", "catalytic_converter", "abs_module",
        "battery", "alternator", "fuel_pump", "ignition_coil",
        "maf_sensor", "throttle_body"
    ]

    static func makeCar(highlight: String) -> Entity {
        let root = Entity()
        root.name = "car_root"

        let body = ModelEntity(
            mesh: .generateBox(size: SIMD3(1.6, 0.35, 0.7), cornerRadius: 0.08),
            materials: [SimpleMaterial(color: .init(white: 0.82, alpha: 1), isMetallic: true)]
        )
        body.name = "body"
        body.position = SIMD3(0, 0.25, 0)
        root.addChild(body)

        let cabin = ModelEntity(
            mesh: .generateBox(size: SIMD3(0.85, 0.28, 0.62), cornerRadius: 0.06),
            materials: [SimpleMaterial(color: .init(white: 0.55, alpha: 0.85), isMetallic: false)]
        )
        cabin.position = SIMD3(-0.1, 0.52, 0)
        root.addChild(cabin)

        // Wheels
        for x in [-0.45, 0.45] as [Float] {
            for z in [-0.38, 0.38] as [Float] {
                let wheel = ModelEntity(
                    mesh: .generateCylinder(height: 0.12, radius: 0.14),
                    materials: [SimpleMaterial(color: .darkGray, isMetallic: false)]
                )
                wheel.orientation = simd_quatf(angle: .pi / 2, axis: SIMD3(1, 0, 0))
                wheel.position = SIMD3(x, 0.14, z)
                root.addChild(wheel)
            }
        }

        let placements: [String: SIMD3<Float>] = [
            "engine": SIMD3(0.45, 0.38, 0),
            "battery": SIMD3(0.55, 0.42, 0.22),
            "alternator": SIMD3(0.35, 0.36, -0.22),
            "maf_sensor": SIMD3(0.25, 0.48, 0.1),
            "throttle_body": SIMD3(0.3, 0.45, -0.05),
            "ignition_coil": SIMD3(0.4, 0.5, 0.05),
            "o2_sensor": SIMD3(-0.2, 0.12, 0.2),
            "catalytic_converter": SIMD3(-0.35, 0.1, 0),
            "fuel_pump": SIMD3(-0.55, 0.2, 0),
            "abs_module": SIMD3(0.1, 0.15, -0.28)
        ]

        for name in partNames {
            let size: Float = name == "engine" ? 0.28 : 0.12
            let entity = ModelEntity(
                mesh: .generateBox(size: size),
                materials: [SimpleMaterial(color: .init(white: 0.35, alpha: 1), isMetallic: true)]
            )
            entity.name = name
            entity.position = placements[name] ?? .zero
            root.addChild(entity)
        }

        applyHighlight(on: root, name: highlight)
        return root
    }

    static func applyHighlight(on root: Entity, name: String) {
        for child in root.children {
            guard let model = child as? ModelEntity else { continue }
            if partNames.contains(child.name) {
                let isTarget = child.name == name
                let color: UIColor = isTarget
                    ? UIColor(red: 0.95, green: 0.35, blue: 0.15, alpha: 1)
                    : UIColor(white: 0.35, alpha: 1)
                model.model?.materials = [SimpleMaterial(color: color, isMetallic: isTarget)]
                model.scale = isTarget ? SIMD3(repeating: 1.25) : SIMD3(repeating: 1)
            }
        }
    }
}
