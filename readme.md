#BadVps

## Setup
Install docker, python, obs, and vlang on windows (ick, i know)
run `Set-ExecutionPolicy unrestricted -Force -Confirm`
run setup.ps1
forward ports 8080 and 8081
open obs
Settings -> stream
Set service to custom
Server: rtmp://127.0.0.1:1935/live
Stream Key: test
Close settings
start stream, minimize everything