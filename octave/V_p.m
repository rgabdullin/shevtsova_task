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
## @deftypefn {Function File} {@var{retval} =} V_p (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ruslixag <ruslixag@ruslixags-acer>
## Created: 2016-03-25

function [res] = V_p (alpha, eps)
  Int = zeros(size(alpha));
  [n,m] = size(alpha);
  for x = 1:n
    for y = 1:m
      Int(x,y) = 2 * quadl(@p,0.001,alpha(x,y),eps);
    endfor
  endfor
  res = Int;
endfunction
