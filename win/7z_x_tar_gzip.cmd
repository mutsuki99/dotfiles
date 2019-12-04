@echo off

rem .tgz 用展開ラッパーコマンド
rem .gz に適用すれば .tar.gz も一発展開可能
rem TODO: 7z.exe (Not 7zG.exe) の窓表示無効化したい

"C:\Program Files\7-Zip\7zG.exe" x "%1" -so | "C:\Program Files\7-Zip\7z.exe" x -si -ttar
