@echo off
chcp 65001 >nul
title 长城·龙魂 · 本地演示服务

cd /d "%~dp0"

echo ═══════════════════════════════════════════════
echo   长城·龙魂 · 本地演示服务
echo ═══════════════════════════════════════════════
echo.

REM 找一个空闲端口 (8086-8093)
set PORT=
for %%p in (8086 8087 8088 8089 8090 8091 8092 8093) do (
    if not defined PORT (
        netstat -an | findstr ":%%p " | findstr "LISTENING" >nul
        if errorlevel 1 (
            set PORT=%%p
        )
    )
)

if not defined PORT (
    echo 没有可用端口 (8086-8093 均被占用)
    pause
    exit /b 1
)

echo   端口: %PORT%
echo   地址: http://localhost:%PORT%/
echo.
echo 浏览器将自动打开。关闭此窗口即结束服务。
echo.

REM 优先尝试 python，其次 py 启动器
where python >nul 2>&1
if %errorlevel% equ 0 (
    set PYCMD=python
) else (
    where py >nul 2>&1
    if %errorlevel% equ 0 (
        set PYCMD=py -3
    ) else (
        echo [错误] 未检测到 Python，请先安装 Python 3
        echo 下载地址: https://www.python.org/downloads/
        echo 安装时请勾选 "Add Python to PATH"
        pause
        exit /b 1
    )
)

REM 延迟 2 秒后打开浏览器（等服务就绪）
start "" cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:%PORT%/index.html"

REM 前台启动服务，关闭窗口自动结束
%PYCMD% -m http.server %PORT%

pause
