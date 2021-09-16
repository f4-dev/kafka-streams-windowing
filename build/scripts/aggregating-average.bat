@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  aggregating-average startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and AGGREGATING_AVERAGE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\aggregating-average-0.0.1.jar;%APP_HOME%\lib\kafka-streams-avro-serde-6.1.1.jar;%APP_HOME%\lib\kafka-avro-serializer-6.1.1.jar;%APP_HOME%\lib\kafka-schema-serializer-6.1.1.jar;%APP_HOME%\lib\kafka-schema-registry-client-6.1.1.jar;%APP_HOME%\lib\avro-1.10.2.jar;%APP_HOME%\lib\slf4j-simple-1.7.30.jar;%APP_HOME%\lib\kafka-streams-2.7.0.jar;%APP_HOME%\lib\config-1.4.1.jar;%APP_HOME%\lib\connect-json-2.7.0.jar;%APP_HOME%\lib\jackson-annotations-2.12.2.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.12.2.jar;%APP_HOME%\lib\jackson-databind-2.12.2.jar;%APP_HOME%\lib\jackson-core-2.12.2.jar;%APP_HOME%\lib\commons-compress-1.20.jar;%APP_HOME%\lib\common-utils-6.1.1.jar;%APP_HOME%\lib\connect-api-2.7.0.jar;%APP_HOME%\lib\kafka-clients-6.1.1-ccs.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\rocksdbjni-5.18.4.jar;%APP_HOME%\lib\zstd-jni-1.4.5-6.jar;%APP_HOME%\lib\lz4-java-1.7.1.jar;%APP_HOME%\lib\snappy-java-1.1.7.7.jar;%APP_HOME%\lib\jersey-common-2.31.jar;%APP_HOME%\lib\jakarta.ws.rs-api-2.1.6.jar;%APP_HOME%\lib\swagger-annotations-1.6.2.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\jakarta.inject-2.6.1.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar


@rem Execute aggregating-average
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %AGGREGATING_AVERAGE_OPTS%  -classpath "%CLASSPATH%" io.confluent.developer.RunningAverage %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable AGGREGATING_AVERAGE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%AGGREGATING_AVERAGE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
