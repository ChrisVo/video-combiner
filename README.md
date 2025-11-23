# Video Combiner

A simple bash script to combine multiple video files using ffmpeg.

## Prerequisites

- ffmpeg must be installed:
  ```bash
  brew install ffmpeg
  ```

## Installation

To make the script available system-wide, simply run:

```bash
./install.sh
```

This will install `combine-videos` to `/usr/local/bin` and you'll be able to use it from anywhere on your system.

## Usage

After installation:

```bash
combine-videos video1.mp4 video2.mp4 video3.mp4 ...
```

Without installation (from this directory):

```bash
./combine-videos video1.mp4 video2.mp4 video3.mp4 ...
```

The script will combine all provided video files in the exact order specified on the command line.

## Examples

Combine videos in the current directory:

```bash
./combine-videos intro.mp4 main.mp4 outro.mp4
```

Combine videos from different locations:

```bash
./combine-videos ~/Downloads/clip1.mp4 ~/Desktop/clip2.mp4 ./clip3.mp4
```

## Output

The script generates an output file with a timestamp:

```
combined_YYYYMMDD_HHMMSS.mp4
```

For example: `combined_20251122_143052.mp4`

## How It Works

- Uses ffmpeg's concat demuxer for fast, lossless concatenation
- The `-c copy` flag copies streams without re-encoding for maximum speed
- Automatically handles both absolute and relative file paths
- Validates all input files exist before processing

## Requirements

- At least 2 video files must be provided
- All video files should have the same codec, resolution, and frame rate for best results
- If videos have different formats, ffmpeg will attempt to combine them but may need to re-encode

## Troubleshooting

If you get codec/format errors, the videos may not be compatible for direct concatenation. In that case, you may need to re-encode them to a common format first.
