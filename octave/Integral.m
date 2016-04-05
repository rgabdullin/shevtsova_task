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
## @deftypefn {Function File} {@var{retval} =} Integral (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ruslixag <ruslixag@ruslixags-acer>
## Created: 2016-03-27

function [res1 res2] = Integral (arrayL, arrayT,eps = 1e-5)
  %T только скаляры
  arrayT0 = 1 ./ (3.*arrayL);
  arrayT1 = 1 ./ (94.*arrayL.^3);
  [arrayT_0 arrayT_1] = size(arrayT);
  [arrayL_0 arrayL_1] = size(arrayL);
  resT = zeros(arrayL_1, arrayT_1);
  for arrayL_x = 1:arrayL_1
    for arrayT_x = 1:arrayT_1
      T = arrayT(arrayT_x);
      L = arrayL(arrayL_x);
      T0 = arrayT0(arrayL_x);
      T1 = arrayT1(arrayL_x);
      if T<T0
        resT(arrayL_x,arrayT_x) = quadl(@(t) p(t./T).* 4.*L.^3 .* t.^2 .* exp(- t.^2 ./ 2),-T,T,eps); 
      elseif T<T1
        integr1 = quadl(@(t) p(t./T).* 4.*L.^3 .* t.^2 .* exp(- t.^2 ./ 2),-T0,T0,eps); 
        integr2 = 2 .* quadl(@(t) p(t./T).*(exp(-t.^2./2) + exp(-t.^2./4))./abs(t),T0,T,eps);
        resT(arrayL_x,arrayT_x) = integr1 + integr2;
      else
        integr1 = quadl(@(t) p(t./T).* 4.*L.^3 .* t.^2 .* exp(- t.^2 ./ 2),-T0,T0,eps); 
        integr2 = 2 .* quadl(@(t) p(t./T).*(exp(-t.^2./2) + exp(-t.^2./4))./abs(t),T0,T1,eps);
        integr3 = 2 .* quadl(@(t) p(t./T).*(exp(-t.^2./2) + 1)./abs(t),T1,T,eps);
        resT(arrayL_x,arrayT_x) = integr1 + integr2 + integr3;
      endif
    endfor
  endfor
  res1 = resT;
endfunction
