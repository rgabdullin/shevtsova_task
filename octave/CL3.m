## Copyright (C) 2016 ruslixag
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} CL3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ruslixag <ruslixag@ruslixags-acer>
## Created: 2016-03-27

function [retval, retval2] = CL3 (array_L,eps = 1e-5)
  retval = zeros(size(array_L));
  retval2 = zeros(size(array_L));
  [n m] = size(array_L);
  for x = 1:n
    for y = 1:m
      L = array_L(x,y);
      T1 = 1/(94*L^3);
      T0 = 1/(3*L);
      gL = @(z) Const(z(1), L, z(2), eps);
      x_min = fminsearch(gL,[4,T1]);
      retval(x,y) = gL(x_min);
      retval2(x,y) = gL([3.2,T1]);
    endfor
  endfor
endfunction
