% -*- texinfo -*-
%
% @deftypefn {myhilb.m} {[ @var{A}, @var{B}] =} myhilb (@var{n}, @var{m}) 
% @cindex 1 hilbert_matrix_for_non_square_matrices
%
% returns the hilbert matrix for non square matrices
%
% arguments are:
%
% @var{n}, @var{m} are size of the Hilbert matrix; if only one argument given, then a square matrix is generated 
% @var{A} is the Hilbert matrix 
% @var{B}: if two matrices are to be returned, then @var{B} is assigned to @var{A'}*@var{A} 
%
% found at: http://read.pudn.com/downloads128/doc/fileformat/543847/Matlab%E8%AE%B2%E4%B9%89%E9%AB%98%E7%BA%A7/ch2/myhilb.m__.htm
% and reformatted decently by Nicola Bernardini
% 2001/12/1 
%
function [A,B]=myhilb(n,m) 
  if (nargin==1)
     m=n;
  end 
  for k=1:n 
     for l=1:m 
        A(k,l)=1/(k+l-1); 
     end 
  end 
  if (nargout==2)
     B=A'*A;
  end
end
