@echo off

rem .tgz �p�W�J���b�p�[�R�}���h
rem .gz �ɓK�p����� .tar.gz ���ꔭ�W�J�\
rem TODO: 7z.exe (Not 7zG.exe) �̑��\��������������

"C:\Program Files\7-Zip\7zG.exe" x "%1" -so | "C:\Program Files\7-Zip\7z.exe" x -si -ttar
