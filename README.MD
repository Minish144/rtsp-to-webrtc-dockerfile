## How to run
1. Make `config.json` according to example file `config.json.example`
2. Build project using
```bash
docker build --tag rtsptowebrtc .
```
3. And run
```bash
docker run -p 8083:8083 --name rtsptowebrtc rtsptowebrtc
```