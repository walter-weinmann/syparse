@echo off
erl -noshell -pa _build\default\lib\syparse\ebin -s test_generator generate -s init stop
