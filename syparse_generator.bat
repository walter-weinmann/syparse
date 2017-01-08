@echo off
erl -noshell -pa _build\default\lib\syparse\ebin -s syparse_generator generate -s init stop
