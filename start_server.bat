@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo =======================================================
echo    부산시 업종별 상권 지도 서비스 실행기 (web2)
echo =======================================================
echo.

:: Check Node.js
where node >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [INFO] Node.js 환경이 감지되었습니다. 로컬 서버를 실행합니다...
    timeout /t 1 >nul
    start http://localhost:3000
    node scripts\server.js
    goto :end
)

:: Check Python fallback
where python >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [INFO] Python 환경으로 로컬 서버를 실행합니다...
    timeout /t 1 >nul
    start http://localhost:3000
    python -m http.server 3000
    goto :end
)

echo [경고] Node.js 또는 Python이 설치되어 있지 않습니다.
echo index.html 파일을 웹 브라우저로 직접 엽니다.
start "" "%~dp0index.html"

:end
pause
