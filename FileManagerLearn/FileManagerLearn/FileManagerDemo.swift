//
//  FileManagerDemo.swift
//  FileManagerLearn
//
//  Created by yangtz on 2024/2/2.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()

    // 保存图片
    func saveImage(Image: UIImage, name: String) ->String {
        guard
            let data = Image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name)
        else {
            return "Error getting data"
        }
        do {
            try data.write(to: path)
            return "Success saving"
        } catch {
            return "Error saving \(error)"
        }
    }

    // 获得图片
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path)
        else {
            print("Error getting path ")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }

    // 删除图片
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path)
        else {
            return "Error getting path, not delete"
        }

        do {
            try FileManager.default.removeItem(at: path)
            return "Successfully deleted"
        } catch let error {
            return "Error deleted image \(error)"
        }

    }

    // 获取图片存储路径
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("\(name).jpg")
        else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "girl"
    let manager = LocalFileManager.instance

    init() {
        getImageFromAssetsFolder()
        // getImageFromManager()
    }

    // 从资源文件夹中拿出图片
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }

    // 从fileManager拿出图片
    func getImageFromManager() {
        print("ok")
        image = manager.getImage(name: imageName)
    }

    // 保存图片
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(Image: image, name: imageName)
    }

    // 删除图片
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
    }
}

struct FileManagerDemo: View {
    @StateObject var vm = FileManagerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }

                HStack {
                    Button(action: {
                        vm.saveImage()
                    }, label: {
                        Text("Save the girl!")
                            .foregroundColor(.white)
                            .padding()
                            .font(.headline)
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        vm.deleteImage()
                    }, label: {
                        Text("Delete the girl!")
                            .foregroundColor(.white)
                            .padding()
                            .font(.headline)
                            .padding(.horizontal)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                Text(vm.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerDemo()
}
