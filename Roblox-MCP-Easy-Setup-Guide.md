# Roblox Executor MCP – Easy Setup (Mobile + Desktop)

Simple guide to connect a **mobile Roblox executor** (Delta, etc.) to **Grok** (or other AI clients) using the Roblox Executor MCP + Cloudflare Tunnel.

---

## Requirements

- Windows PC
- [Node.js 18+](https://nodejs.org/)
- [cloudflared](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation/)  
  (or install with: `winget install Cloudflare.cloudflared`)
- Mobile Roblox executor that supports `loadstring` / `HttpGet` (Delta, etc.)

---

## Quick Setup

### 1. Download the original MCP

Download and extract it (example: `C:\roblox-executor-mcp`)

### 2. Build it

Open a terminal inside the MCP folder and run:

```bash
npm install -g pnpm
pnpm install
pnpm run build
```

### 3. Start the MCP Server

Double-click `start-mcp.bat`  
**or** run:

```bash
node dist/index.js
```

Leave this window open. It runs on `http://localhost:16384`.

### 4. Start Cloudflare Tunnel

Open a **second** terminal and run:

```bash
cloudflared tunnel --url http://localhost:16384
```

Or double-click `start-tunnel.bat`.

It will give you a link like:
```
https://xxxx.trycloudflare.com
```

**Copy that link.**

### 5. Add to Grok

1. Go to [https://grok.x.ai](https://grok.x.ai)
2. Open **Connectors → Custom MCP**
3. Paste: `https://xxxx.trycloudflare.com/mcp`
4. Save

### 6. Connect from Roblox (Mobile)

Run this in your executor (replace the domain):

```lua
getgenv().BridgeURL = "xxxx.trycloudflare.com"   -- no https:// and no /mcp
getgenv().DisableWebSocket = true
loadstring(game:HttpGet("https://gitlab.com/upio/roblox-executor-mcp/-/raw/main/connector.luau"))()
```

---

## How to Keep It Running Longer

### Prevent PC Sleep
Go to **Settings → System → Power & battery → Screen and sleep**  
Set **When plugged in, put my device to sleep** → **Never**

### Auto-restart Tunnel (optional)
Create a file called `keep-tunnel.bat`:

```bat
@echo off
title Cloudflare Tunnel - Keep Alive
:loop
echo Starting tunnel...
cloudflared tunnel --url http://localhost:16384
echo Tunnel died. Restarting in 5 seconds...
timeout /t 5
goto loop
```

Run this instead of the normal tunnel.  
⚠️ Note: every time it restarts, the Cloudflare URL changes and you must update it in Grok + the Roblox script.

---

## Notes

- Keep **both** the MCP server and the tunnel windows open
- Free Cloudflare tunnels are temporary — the link changes every time you restart the tunnel
- You must update the link in **Grok** and in the **Roblox script** whenever the tunnel restarts
- Dashboard is available at `http://localhost:16384` while the server is running

---

## Files included

| File              | Purpose                          |
|-------------------|----------------------------------|
| `start-mcp.bat`   | Starts the MCP server            |
| `start-tunnel.bat`| Starts the Cloudflare tunnel     |
| `connector.lua`   | Optional local connector script  |

---

Made for easy sharing.
