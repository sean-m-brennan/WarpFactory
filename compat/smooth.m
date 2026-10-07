function y = smooth(x, span)
  % stand-in for Curve Fitting Toolbox smooth(): moving average, odd span, shrinks at ends
  span = floor(span); if mod(span,2)==0, span = span-1; end; span = max(span,1);
  sz = size(x); x = x(:); n = numel(x); y = zeros(n,1); h = (span-1)/2;
  for i = 1:n, k = min([h, i-1, n-i]); y(i) = mean(x(i-k:i+k)); end
  % MATLAB smooth always returns a column vector
end
