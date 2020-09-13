@echo off
:: Cria um novo arquivo de daily baseado no enterece atual 


title New Day 

echo [%date%]'*._,*'^'*._,*'^'*._,*'^'*._
echo.
echo Bom dia! Como vai? 
echo.

:: pega a data
for /f "tokens=1-3 delims=/"  %%A  in ("%date%") do  SET Data=%%A.%%B.%%C

:: Verefica se existe
if  exist Daily\%DATA% (
  echo Ja existe a pasta de hj ok
  Start explorer Daily\%DATA%
  pause
  exit /b
)

::-----------------------------------------------------

:lbl_doc
SET /p VAR=Doc padrao ou em branco? (p/b) 

IF %VAR% EQU p goto lbl_std 
IF %VAR% EQU b goto lbl_blank

echo.
echo vc escreveu errado, repete pf
goto lbl_doc

:: "abre o arquivo"
:lbl_std
SET doc="Standard_File.txt"
goto d

:lbl_blank
SET doc="Blank_FIle.txt"

:d

::-----------------------------------------------------
::Cria as coisas 
md Daily\%DATA%\
copy %doc% Daily\%DATA%\%DATA%.txt

::-----------------------------------------------------
:: Topico adicional?
:prox
Set /p VAR=Topico adicional?(s/n)
IF %VAR% EQU s goto lbl_sim
IF %VAR% EQU n goto lbl_nao

echo.
echo vc escreveu errado, repete pf
goto prox

:lbl_sim
Set /p VAR=Qual?

::-----------

:: escreve
copy nul alx.txt

echo %VAR%> alx.txt
for %%? in (alx.txt) do (set /a tam=45-%%~z?)
del alx.txt

for /l  %%i in (0, 1, %tam%) do CALL :linha %%i
echo %VAR%%strLinha% >> Daily\%DATA%\%DATA%.txt
echo. >> Daily\%DATA%\%DATA%.txt
SET strLinha=
goto :prox

:linha
SET strLinha=%strLinha%=
goto :EOF

::-----------------------------------------------------
:: abre coisa 
:lbl_nao
echo. 
echo obrigado!
explorer Daily\%DATA%
pause

::-----------------------------------------------------
EXIT	
