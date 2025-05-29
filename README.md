**🇬🇧 English below [↓](https://github.com/HuyTheKiller/VietnameseBalatro?tab=readme-ov-file#vietnamese-balatro-)**
# Balatro Tiếng Việt 🇻🇳

Đây là một bản mod cài tiếng Việt vào Balatro.
Dự án này độc lập với [bản mod của Kanbei](https://github.com/Kanbei-Kikuchiyo/balatro-vietnamese-translation), với điểm nhấn nằm ở việc nó sử dụng font chữ bạn vẫn thường thấy khi dùng tiếng Anh, cũng như được tích hợp sẵn tính năng của [LocFixer](https://github.com/HuyTheKiller/LocFixer).

# Hướng dẫn cài mod

## Chuẩn bị Lovely Injector (bắt buộc)
- Từ v1.3.0 trở đi, VietnameseBalatro hỗ trợ việc cài đặt không phụ thuộc vào Steamodded. Tuy nhiên, phương thức cài này **CỰC KÌ THIẾU ỔN ĐỊNH** và không sử dụng font chữ nêu trên. Khuyến cáo cho người mới cài lần đầu cứ cài thêm Steamodded cho chắc cú.
- Bạn có thể xem hướng dẫn cách cài Lovely [tại đây](https://github.com/ethangreen-dev/lovely-injector?tab=readme-ov-file#manual-installation).

## Chuẩn bị Steamodded 1.0.0 (tự chọn nhưng khuyên dùng)
- Bản 0.9.8 chưa có API cho Ngôn Ngữ. [Bản mod của Kanbei](https://github.com/Kanbei-Kikuchiyo/balatro-vietnamese-translation) sử dụng Lovely thuần tuý và không có hướng dẫn cách cài đặt cho bất kì hệ điều hành nào khác ngoài Windows.
- Bạn có thể xem hướng dẫn cách cài Steamodded 1.0.0 [tại đây](https://github.com/Steamodded/smods/wiki).

## Cài đặt thủ công
- Chọn 1 trong 2 cách sau:
- 1. Nhấn vào [đây](https://github.com/HuyTheKiller/VietnameseBalatro/releases/latest) để đến trang Release chứa phiên bản mới nhất rồi nhấn vào VietnameseBalatro_v1.x.x.zip để tải về.
- 2. Nhấn vào [đây](https://github.com/HuyTheKiller/VietnameseBalatro/archive/refs/heads/main.zip) để tải ngay bản mới nhất (main branch).
- Giải nén rồi kéo thả thư mục "VietnameseBalatro" (không được phép lồng thư mục trùng tên) vào trong thư mục "Mods". Địa chỉ tương ứng của nó sẽ là:
**Windows:** `%AppData%/Balatro`; **Mac:** `~/Library/Application Support/Balatro`; **Linux (WINE/Proton):** `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro`
- **Nếu không có Steamodded:** chọn thư mục "localization" bên trong thư mục "VietnameseBalatro", sao chép (Cmd/Ctrl+C) rồi dán (Cmd/Ctrl+V) ở bên ngoài thư mục "Mods" (tức là có chung thư mục cha của "Mods"). Sau khi dán, vào thư mục vừa mới dán xong, sau đó xoá "en-ua.lua" và "default.lua" đi.

# Lưu ý khi sử dụng mod
- Nếu bạn sử dụng Lovely thuần tuý, khi vào game lần kế tiếp sẽ xảy ra crash do lỗi: `attempt to index a nil value`
- Để hạn chế tối đa điều đó, trả về tiếng Anh trước khi đóng Balatro.
## Cách giải quyết nếu nó xảy ra:
- Kéo thư mục "localization" ở ngoài thư mục "Mods" ra khỏi vị trí ban đầu (ở đâu cũng được, đừng để nguyên chỗ cũ)
- Khởi chạy Balatro từ Steam để tái thiết tuỳ chọn ngôn ngữ
- Đóng Balatro rồi trả thư mục về chỗ cũ
# Danh sách tính năng/công việc đang chờ
- Việt hoá một số mod nổi tiếng


---


# Vietnamese Balatro 🇻🇳

This is a mod that adds Vietnamese translation to Balatro.
Note that this project is independent of [Kanbei's mod](https://github.com/Kanbei-Kikuchiyo/balatro-vietnamese-translation), with the noticable points being that it uses the same font as the one you see in English, as well as preemptively including [LocFixer](https://github.com/HuyTheKiller/LocFixer)'s features.

# How to install this mod

## Prepare Lovely Injector (required)
- Starting from v1.3.0, VietnameseBalatro supports installation without Steamodded dependency. However, this method is **VERY UNSTABLE** and does not use the aforementioned font. For those who are new to modding it's highly recommended to just install Steamodded along.
- You can vew the instructions to install Lovely [here](https://github.com/ethangreen-dev/lovely-injector?tab=readme-ov-file#manual-installation).

## Prepare Steamodded 1.0.0 (optional but recommended)
- 0.9.8 version doesn't have Language API. [Kanbei's mod](https://github.com/Kanbei-Kikuchiyo/balatro-vietnamese-translation) purely relies on Lovely patches and does not provide instructions for any other operating systems outside Windows.
- You can view the instructions to install Steamodded 1.0.0 [here](https://github.com/Steamodded/smods/wiki).

## Manual installation
- Chọn one of the following ways:
- 1. Click [here](https://github.com/HuyTheKiller/VietnameseBalatro/releases/latest) to head to the Release page of the latest version then click on VietnameseBalatro_v1.x.x.zip to download it.
- 2. Click [here](https://github.com/HuyTheKiller/VietnameseBalatro/archive/refs/heads/main.zip) to instantly download the latest main branch.
- Unzip the archive then drag and drop the "VietnameseBalatro" folder (nested folder with the same name is not allowed) into "Mods". Its respective directory for each OS will be:
**Windows:** `%AppData%/Balatro`; **Mac:** `~/Library/Application Support/Balatro`; **Linux (WINE/Proton):** `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro`
- **When installed without Steamodded:** choose the "localization" folder inside "VietnameseBalatro", copy (Cmd/Ctrl+C) then paste (Cmd/Ctrl+V) it outside "Mods" (in the same parent folder of "Mods"). After pasting, go inside the newly pasted folder, then delete "en-ua.lua" and "default.lua".

# Important notes while using this mod
- If you're using pure Lovely, you'll encounter a crash the next time you enter the game due to the following error: `attempt to index a nil value`
- To minimize that, revert to English before closing Balatro.
## How to solve the problem when it happens:
- Move the "localization" folder outside "Mods" to somewhere else (anywhere but the initial spot works)
- Launch Balatro via Steam to reset language option
- Return folder to its initial position
# To-do list
- Add Vietnamese localization to well-known mods