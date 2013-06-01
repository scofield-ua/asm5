.386
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
BSIZE equ 15
.data
ifmt db "%d",0
stdout dd ?
cWritten dd ?
.data?
buf db BSIZE dup(?)
.code
start:
invoke GetStdHandle,STD_OUTPUT_HANDLE
mov stdout,eax
mov eax, 100
mov edx, 0
mov ebx, 3
div ebx
invoke wsprintf,ADDR buf,ADDR ifmt,eax
invoke WriteConsoleA,stdout,ADDR buf,BSIZE,ADDR cWritten,NULL
invoke ExitProcess,0
end start