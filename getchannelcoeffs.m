function chcoeffs = getchannelcoeffs(tx, rx, ntaps)
    % Determines channel coefficients using the Wiener-Hopf equations 
    % (LMS Solution).
    % TX    = Transmitted (channel input) waveform, row vector, length must 
    %         be >> ntaps.
    % RX    = Received (channel output) waveform, row vector, length must 
    %         be >> ntaps.
    % NTAPS = Number of taps for channel coefficients
    % Dan Boschen 1/13/2020

    tx = tx(:)';   % force row vector
    rx = rx(:)';   % force row vector
    depth = min(length(rx), length(tx));
    A = convmtx(rx(1:depth).', ntaps);
    R = A'*A;       % autocorrelation matrix
    X = [tx(1:depth) zeros(1, ntaps - 1)].';
    ro = A'*X;      % cross correlation vector
    chcoeffs = (inv(R) * ro);   % solution
    
end