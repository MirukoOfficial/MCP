@echo off
title Cloudflare Tunnel
echo Starting Cloudflare Tunnel...
echo.
echo After it starts, copy the https://xxxx.trycloudflare.com link
echo Then add /mcp at the end when putting it in Grok.
echo.
cloudflared tunnel --url http://localhost:16384
pause
