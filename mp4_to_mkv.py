import os
import sys
import subprocess

def get_files(folder_name):
    mp4_files = []
    mkv_files = []
    for root, dirs, files in os.walk(folder_name):
        for name in files:
            if name.endswith(".mp4"):
                mp4_files.append(os.path.join(root, name))
            if name.endswith(".mkv") and "waifu2x_2x" not in name:
                mkv_files.append(os.path.join(root, name))
    return [mkv_files, mp4_files]

def get_files_by_extenstion(folder_name, extension):
    out_files = []
    for root, dirs, files in os.walk(folder_name):
        for name in files:
            if name.endswith(extension):
                out_files.append(os.path.join(root, name))
    return out_files

def convert_to_mkv(files):
    print("Converting to mkv ...")
    mkv_files = []
    for file in files:
        file_name = os.path.splitext(os.path.basename(file))[0]
        dir_name = os.path.dirname(file)
        output_file = os.path.join(dir_name, file_name + ".mkv")
        subprocess.run([
            "ffmpeg.exe",
            "-i", f"{file}",
            "-vcodec", "copy",
            "-acodec", "copy",
            f"{output_file}"
        ])
        mkv_files.append(output_file)
    # [os.remove(x) for x in files]
    return mkv_files

def extract_subtitles(files):
    print("Extracting subtitles ...")
    sub_files = []
    for file in files:
        file_name = os.path.splitext(os.path.basename(file))[0]
        dir_name = os.path.dirname(file)
        output_file = os.path.join(dir_name, file_name + ".ssa")
        subprocess.run([
            "ffmpeg.exe",
            "-i", f"{file}",
            f"{output_file}"
        ])
        sub_files.append(output_file)
    return sub_files

def put_subtitles(mkv_files, sub_files):
    print("Putting subtitles  ...")
    for mkv_file, sub_file in zip(mkv_files, sub_files):
        file_name = os.path.basename(mkv_file)
        dir_name = os.path.dirname(mkv_file)
        output_file = os.path.join(dir_name, "output", file_name)
        subprocess.run([
            "ffmpeg.exe",
            "-i", f"{mkv_file}",
            "-i", f"{sub_file}",
            "-map", "0",
            "-map", "1",
            "-metadata:s:s:0",
            "language=esp",
            "-c", "copy",
            f"{output_file}"
        ])
    # [os.remove(x) for x in mkv_files]
    # [os.remove(x) for x in sub_files]

if __name__ == "__main__":
    try:
        folder_name = sys.argv[1]
    except:
        sys.exit("No folder")

    print(f"Folder name: {folder_name}")

    mkv_files, mp4_files = get_files(folder_name)
    sub_files = extract_subtitles(mkv_files)
    mkv_files = convert_to_mkv(mp4_files)

    # mkv_files = get_files_by_extenstion(folder_name, ".mkv")
    # sub_files = get_files_by_extenstion(folder_name, ".ssa")

    put_subtitles(mkv_files, sub_files)
