import SwiftUI
import PhotosUI

struct VideoUploadView: View {
    @Environment(AppModel.self) private var appModel
    @State private var title = ""
    @State private var dtcCode = ""
    @State private var summary = ""
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedFileName: String?
    @State private var message: String?
    @State private var showPaywall = false
    @State private var isUploading = false

    var body: some View {
        NavigationStack {
            Form {
                Section(String(localized: "upload.details")) {
                    TextField(String(localized: "upload.title"), text: $title)
                    TextField(String(localized: "diagnose.dtc"), text: $dtcCode)
                        .textInputAutocapitalization(.characters)
                    TextField(String(localized: "upload.summary"), text: $summary, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section(String(localized: "upload.media")) {
                    PhotosPicker(selection: $pickerItem, matching: .videos) {
                        Label(
                            selectedFileName ?? String(localized: "upload.pick"),
                            systemImage: "video.badge.plus"
                        )
                    }
                    .onChange(of: pickerItem) { _, newValue in
                        Task { await resolvePicker(newValue) }
                    }
                }

                Section {
                    let remaining = appModel.authService.remainingVideoQuota(
                        isPremium: appModel.subscriptionService.effectivePremium
                    )
                    Text("\(remaining) uploads left this month")
                        .font(.footnote)
                        .foregroundStyle(AppTheme.muted)

                    Button {
                        Task { await submit() }
                    } label: {
                        if isUploading {
                            ProgressView()
                        } else {
                            Text(String(localized: "upload.submit"))
                        }
                    }
                    .disabled(isUploading)
                }

                if let message {
                    Section {
                        Text(message).foregroundStyle(AppTheme.accent)
                    }
                }
            }
            .navigationTitle(String(localized: "tab.upload"))
            .sheet(isPresented: $showPaywall) {
                PaywallView()
            }
        }
    }

    private func resolvePicker(_ item: PhotosPickerItem?) async {
        guard let item else { return }
        if let data = try? await item.loadTransferable(type: Data.self) {
            selectedFileName = "video_\(data.count / 1024)kb.mov"
        } else {
            selectedFileName = "selected_video.mov"
        }
    }

    private func submit() async {
        message = nil
        guard let user = appModel.authService.currentUser else { return }
        guard DtcParser.isValid(dtcCode) else {
            message = String(localized: "error.dtc.invalid")
            return
        }
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            message = String(localized: "upload.error.title")
            return
        }

        let remaining = appModel.authService.remainingVideoQuota(
            isPremium: appModel.subscriptionService.effectivePremium
        )
        if remaining <= 0 {
            showPaywall = true
            return
        }

        isUploading = true
        defer { isUploading = false }

        // Local demo enqueue — swap for Firebase Storage upload later.
        _ = appModel.videoService.enqueueUpload(
            dtcCode: dtcCode,
            title: title,
            author: user,
            durationSeconds: 120,
            localFileName: selectedFileName
        )
        _ = appModel.repairService.addPost(
            dtcCode: dtcCode,
            title: title,
            summary: summary.isEmpty ? title : summary,
            author: user,
            makeModel: nil
        )
        appModel.authService.recordVideoUpload()
        message = String(localized: "upload.success")
        title = ""
        dtcCode = ""
        summary = ""
        selectedFileName = nil
        pickerItem = nil
    }
}
