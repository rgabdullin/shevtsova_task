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
## @deftypefn {Function File} {@var{retval} =} Q_p (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ruslixag <ruslixag@ruslixags-acer>
## Created: 2016-03-27

function [res] = Q_p (arrayL, arrayT)
  [n m] = size(arrayT);
  res = zeros(size(arrayT));
  for x = 1:n
    for y = 1:m
      T = arrayT(x,y);
      L = arrayL(x,y);
      T0 = 1 / (3*L);
      T1 = 1 / (94*L^3);
      if T0 < T1
        if T < T0
          Qp = (4/sqrt(2*pi) - 8/pi*(1 - exp(-T^2/2))/T);
        elseif T < T1
          Qp = (4/sqrt(2*pi) - 4/pi*(T0*exp(-T0^2/2) - T0^2/T*exp(-T0^2/2) + 2*(1 - exp(-T0^2/2))/T) + 
          27*T0/pi*(exp(-T0^2/2)+exp(-T0^2/4)-exp(-T^2/2)-exp(-T^2/4)));
        else
          Qp = (4/sqrt(2*pi) - 4/pi*(T0*exp(-T0^2/2) - T0^2/T*exp(-T0^2/2) + 2*(1 - exp(-T0^2/2))/T) + 
          27*T0/pi*(exp(-T0^2/2)+exp(-T0^2/4)-exp(-T1^2/2)-exp(-T1^2/4)) + 
          94/pi*(T1*log(T/T1)+(exp(-T1^2/2)-exp(-T^2/2))/T1+(T1^2-T*T1)/T));
        endif
      else 
        if T < T0
          Qp = (4/sqrt(2*pi) - 8/pi*(1 - exp(-T^2/2))/T);
        else 
          Qp = (4/sqrt(2*pi) - 4/pi*(T0*exp(-T0^2/2) - T0^2/T*exp(-T0^2/2) + 2*(1 - exp(-T0^2/2))/T) + 
          27/pi*(T0^3*log(T/T0)-T0*(exp(-T0^2/2)-exp(-T^2/2))+T0^4/T-T0^3));
        endif
      endif
      res(x,y) = Qp * L^3;
    endfor
  endfor
endfunction
