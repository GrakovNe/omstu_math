#!/usr/bin/env python
# -*- coding: cp866 -*-

import math

Accuracy = 0.0001

A = 3.0
B = 5.0

def GetValue(x):
	Function = -0.564 - 4.394 * x - 3.407 * (x**2) + (x**3)
	return Function
	
def GetNewPoint(A,B):
	Result = A - GetValue(A) / (GetValue(A) - GetValue(B)) * (A - B)
	Result = round(Result, 5)
	return Result, abs(A - Result)
	
print "f(A) = %s" % GetValue(A)
print "f(B) = %s" % GetValue(B)
print "f''(x) = 6 * x - 6.814 - ������⥫쭠 �� ��१�� [3;5]"
print "=> ��窠 B - ���������� �����"


while (True):
	Current_Iteration = GetNewPoint(A, B)
	A = Current_Iteration[0]
	print "����騩 ��७�: %s; ��筮���: %s" % (Current_Iteration[0], Current_Iteration[1])
	if (Current_Iteration[1] < Accuracy):
		break

print "\n\n��襭�� �������!"





