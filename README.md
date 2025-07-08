# SRoll

Simple command-line tool to play random tracks on Spotify.  

## Requirements

- macOS *for now*
- Spotify Desktop App must be installed and logged in

## Usage

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

You can try it out with:

```
sroll --include miku
```

Include multiple playlists:

```
sroll --include miku tiktok
```

Or let it choose completely at random:

```
sroll
```

## License

SRoll is distributed under the MIT License.
