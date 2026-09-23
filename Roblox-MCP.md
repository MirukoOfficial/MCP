# Step-by-step setup

## 1. Download the project

Download the ZIP:

```text
https://gitlab.com/upio/roblox-executor-mcp/-/archive/main/roblox-executor-mcp-main.zip
```

Extract it to:

```text
C:\roblox-executor-mcp
```

## 2. Install the requirements

Install Node.js from:

```text
https://nodejs.org/
```

Then open PowerShell and run:

```powershell
npm install -g pnpm
winget install Cloudflare.cloudflared
```

Close and reopen PowerShell afterward.

## 3. Enter the project folder

Run:

```powershell
cd C:\roblox-executor-mcp
```

Check that you are in the correct folder:

```powershell
dir
```

You should see:

```text
package.json
```

If you do not see `package.json`, you are in the wrong folder.

## 4. Install and build

Run:

```powershell
pnpm install
pnpm run build
```

Check that the output exists:

```powershell
dir .\dist
```

You should see:

```text
index.js
```

## 5. Start the MCP server

Run:

```powershell
node .\dist\index.js
```

Do not run this from:

```text
C:\Users\ZeroExTwenty
```

Run it from:

```text
C:\roblox-executor-mcp
```

The correct PowerShell prompt should look like:

```text
PS C:\roblox-executor-mcp>
```

Keep this window open.

## 6. Check the local server

Open your browser and visit:

```text
http://localhost:16384
```

If the page opens, the MCP server is running.

## 7. Start the tunnel

Open a second PowerShell window and run:

```powershell
cloudflared tunnel --url http://localhost:16384
```

Wait for a URL similar to:

```text
https://example-name.trycloudflare.com
```

Copy that URL and keep the tunnel window open.

## 8. Add it to your AI client

Add `/mcp` to the end of the Cloudflare URL:

```text
https://example-name.trycloudflare.com/mcp
```

Paste that complete address into your AI client’s custom MCP or connector settings.

## 9. Configure the Roblox connector

Use the Cloudflare domain without `https://` and without `/mcp`.

Example:

```text
example-name.trycloudflare.com
```

Follow the connector instructions included in the project you downloaded. Do not use scripts from unofficial or untrusted sources.

## 10. Keep everything running

You must keep these open:

1. The MCP server PowerShell window.
2. The Cloudflare tunnel PowerShell window.
3. Roblox with the connector running.

If you close either PowerShell window, the connection stops.

## If you get the same error

Run these commands exactly:

```powershell
cd C:\roblox-executor-mcp
pnpm install
pnpm run build
node .\dist\index.js
```

The key fix is:

```powershell
cd C:\roblox-executor-mcp
```

before running Node.
