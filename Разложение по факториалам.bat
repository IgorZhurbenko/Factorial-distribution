echo off
setlocal enableextensions enabledelayedexpansion
set /p a="Choose value to calc: "
set answer=""
rem call :factorial_distribution %a% answer

call :factorial_distribution %a% answer

echo "The answer is: %answer%"

pause

exit

:factorial_distribution
setlocal enableextensions enabledelayedexpansion
	
	set var3=%1
	set res3=
	
	:calc3
		call :previous_factorial %var3% pf
		call :factorial %pf% f
		if %var3% gtr 0 (
		set res3=%res3% %pf%
		set /a var3=%var3%-%f%
		rem echo pf=%pf%, f=%f%, var3=%var3%, res3=%res3%
		rem pause
		goto calc3)
		
		
		
	endlocal & set %2=%res3%
	rem echo res3=%res3%
		
	

	exit /b 0

:factorial
	setlocal enableextensions enabledelayedexpansion
	set var=%1 
	set mult=1 	
	
	:calc1
		rem echo %var%
		rem pause
		if %var% leq 1 (
		set /a res=%mult%
		) else (
		set /a mult=%mult%*%var%
		set /a var=%var%-1
		goto calc1
		)
		
	endlocal & set /a %2=%res%
	set var=
	set mult=
	set res=
	exit /b 0
	
:previous_factorial
	setlocal enableextensions enabledelayedexpansion
	
	set /a var2=%1
	
	set n=1
		
	:calc2
		call :factorial %n% m
		if %var2% gtr %m% (
		set /a n=%n%+1
		goto calc2) else (
		set /a res=%n%-1)
	
	endlocal & set /a %2=%res%
	set var2=
	set n=
	set res=
	exit /b 0

	
	
	
	