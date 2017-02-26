% -*- texinfo -*-
%
% @deftypefn {one_column_hilb.m} {@var{A} =} one_column_hilb (@var{n})
% @cindex 1 hilbert_matrix_for_real_signals
%
% returns the hilbert matrix for single column vectors (such as audio signals)
%
% arguments are:
%
% @var{n} is the real signal (n rows x 1 column)
% @var{A} is the one-column Hilbert matrix 
%
% derived from: http://read.pudn.com/downloads128/doc/fileformat/543847/Matlab%E8%AE%B2%E4%B9%89%E9%AB%98%E7%BA%A7/ch2/myhilb.m__.htm
% and reworked to one column by Nicola Bernardini
% 2001/12/1 
% 2017/02/25
%
function [A,B] = one_column_hilb(n)
  % there's only one column, so no need to calculate columns at all
  temp = [1:length(n)]';
  A = 1./temp;
end
