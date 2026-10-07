function C = pagemtimes(A, varargin)
  % stand-in for MATLAB pagemtimes(A,B) / pagemtimes(A,opA,B,opB), 'none'|'transpose'
  if numel(varargin) == 1, B = varargin{1}; opA = 'none'; opB = 'none';
  else, opA = varargin{1}; B = varargin{2}; opB = varargin{3}; end
  if strcmpi(opA, 'transpose'), A = permute(A, [2 1 3:ndims(A)]); end
  if strcmpi(opB, 'transpose'), B = permute(B, [2 1 3:ndims(B)]); end
  sa = size(A); sb = size(B); pg = sa(3:end); if isempty(pg), pg = 1; end
  A = reshape(A, sa(1), sa(2), 1, []); B = reshape(B, 1, sb(1), sb(2), []);
  C = reshape(sum(A .* B, 2), [sa(1), sb(2), pg]);
end
