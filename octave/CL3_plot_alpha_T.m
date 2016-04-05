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
## @deftypefn {Function File} {@var{retval} =} CL3_plot_alpha_T (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ruslixag <ruslixag@ruslixags-acer>
## Created: 2016-04-04

function [X,Y,Z] = CL3_plot_alpha_T(L,alpha,eps = 1e-5)
  T1 = 1 / (94*L^3);
  T0 = 1 / (3*L);
  T = min([T0 T1])/2:(2*max([T0 T1])-min([T0 T1])/2)/100:2*max([T0 T1]);
  [X Y] = meshgrid(alpha,T);
  Z = zeros(size(X));
  for x = 1:size(X)(1)
    for y = 1:size(X)(2)
      Z(x,y) = Const(X(x,y),L,Y(x,y),eps);
    endfor
  endfor
  
endfunction
