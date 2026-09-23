@echo off
title Cloudflare Tunnel - Keep Alive
:loop
echo Starting tunnel...
cloudflared tunnel --url http://localhost:16384
echo.
echo Tunnel died. Restarting in 5 seconds...
timeout /t 5
goto loop
