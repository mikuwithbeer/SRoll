# SRoll

SRoll is a simple command-line tool to play random tracks on Spotify.

## Requirements

- **macOS** (currently only supported platform)
- **Spotify Desktop App** (must be installed and logged in)

## Configuration

Create a JSON config file at `~/.sroll.json` with the following structure:

```json
{
  "delay": 1000,
  "playlist": {
    "miku": [
      "4Cm1crfy5GQw1OiEuFjAXO",
      "4yug2vxP12JjgRDOURtvNY",
      "https://open.spotify.com/track/0AcAR8Ih9f8YzrkPgduUf8"
    ],
    "tiktok": [
      "https://open.spotify.com/track/2CIlKt4lRwAAUx5fYgCBxN",
      "5K2onWVFDevmZ5y9AgiEcr",
      "6Ql2mpc1EbGp0GI6CbaGT4",
      "https://open.spotify.com/track/0RgKtaVv27Nff2y29qaD8W",
      "0EqczV3o6fwksegAavIHpX"
    ]
  }
}
```

- `delay` is the time (in milliseconds) to wait before playback starts.
- Each playlist can contain Spotify track IDs or full track URLs.

## Usage

Play a random track from a specific playlist:

```
sroll --include miku
```

Include multiple playlists:

```
sroll --include miku tiktok
```

Let SRoll choose from all playlists at random:

```
sroll
```

## Caution

> **SRoll requires Accessibility permissions to simulate keyboard events.**
> If you do not grant these permissions, playback control will not work.

## License

SRoll is distributed under the MIT License.
