rem I'm don't want add comments, so, idk, read script. :d 
@echo off
mode con: cols=80 lines=30 
chcp 65001
:starter
cls
call :random_color
title OneTap Offset Updater. Build: 27.09.2019 / 1.0.2.1
set language=unknown
echo.
echo.
echo		        @-------------------------------------------@
echo 	        #					    #
echo		        #          ONETAP OFFSET UPDATER            #  
echo		        #           SIGNATURES: 0x000cb             #
echo		        #             SOFT: HoShiMin                #
echo 	        #					    #
echo  	        #   (c) All rights reserved YouGame Inc.    #
echo	 		#					    #
echo		        @-------------------------------------------@
echo.
echo.
ping 0.0.0.0 -n 5 > nul 
echo #Select language / Выберите язык.
echo.
echo #For select english language enter en.
echo #Чтобы выбрать русский язык напишите ru.
echo.
set /p language="Language: "
if "%language%"=="ru" goto :insignia
if "%language%"=="en" goto :insignia
goto language_not_selected
:insignia
cls
echo.
echo.
call :language_interpreter %language%, "Search new offsets. This can take 1-2 min, please wait...." , "Поиск новых оффсетов. Это может занять 1-2 минуты, ожидайте...."
call :insignia_search_module, :patcher
:patcher
echo.
call :language_interpreter %language%, "Offsets found. Patching onetap...", "Оффсеты найдены. Начинаем патчить вантап..."
call :patcher_module, :end
:end
echo.
call :language_interpreter %language%, "Onetap updated. Good luck!", "Вантап обновлен. Удачной игры!"
echo.
call :language_interpreter %language%, "You can also look at my topic on yougame, and put the reaction 'I like'", "Также вы можете заглянуть в мою тему на yougame, и поставить реакцию 'Мне нравится'
start https://yougame.biz/threads/101259/
echo.
echo.
ping 0.0.0.0 -n 10 > nul
exit
:insignia_search_module
cd Insignia
Insignia.exe sigs.txt offsets.txt ../client_panorama.dll
cd ..
goto %~1
:patcher_module
cd Patcher
patcher.exe ../Insignia/offsets.txt ../onetap.dll
cd..
goto %~1
:language_not_selected
color 4
cls
echo.
echo.
echo		        @-------------------------------------------@
echo 	        #					    #
echo		        #             SELECT LANGUAGE!              #  
echo		        #	       ВЫБЕРИТЕ ЯЗЫК!	    	    #
echo	 		#					    #
echo		        @-------------------------------------------@
ping 0.0.0.0 -n 5 > nul
goto :starter
:random_color
set /a random=%random% %% 16
set HEX=0123456789ABCDEF
call set random_color=%%HEX:~%random%,1%%%%,1%%
color %random_color%
:language_interpreter
 if "%~1"=="en" (
	echo %~2
 )
 if "%~1"=="ru" ( 
     echo %~3
 )