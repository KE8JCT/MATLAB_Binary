%This script aims to simulate a transmitter and receiver magnetic dipole.
%The transmitter will pulse data, initially in OOK (on-off keying; morse
%code) and will progress to frequency-shift keying. The receiver will
%attempt to receive this data and decode it.

%Define initial equations

%{
button = uicontrol('String', 'button', 'Style', 'pushbutton', 'Callback', @Callback);
s=0

function Callback(ObjectH, EventData)
	s=1;
end

H = (I * a) / (2 * abs(z)^3);

a = 1; %area is arbitrary, constant, and equal for both loops

%I(t) = 
%}
%{
h = loopCircular
h.TiltAxis ='X'; 
h.Tilt = 90;
show(h)
[e, h] = EHfields(h,4e4, [0;0;1])
%}

%The following is an attempt to modulate and demodulate binary phase-shift
%keying
string = 'test';
unicodeValues = double(string);
b = de2bi(unicodeValues);

b = reshape(b,1, []);

B = (b + .5)*10;
c = ones(1, length(B)*10);
C = c


for d = 0:(length(B)-1)
    for e = 1:10
        C(e+(d*10)) = B((d+1));
    end
end

tt = 0:.0358:10
F = C(:)
xx = sin(2*pi*C.*tt);
yy = sin(2*pi*F*tt);
%{
%To plot two B-FSK Signals
tiledlayout(2, 1)
nexttile
plot(tt, xx)
title('Binary FSK signal')
xlabel('TIME (sec)')
nexttile
plot(tt, yy)
title('Binary FSK signal - Blocky')
xlabel('TIME (sec)')
%}
%Binary Phased-Shift Keying

for d = 0:(length(b)-1)
    for e = 1:10
        c(e+(d*10)) = b((d+1));
    end
end
zz = sin(2*pi*.789*tt+180*c)
plot(tt, zz)
hold on
plot(tt, c)
title('Binary Phased-Shift Keying')
xlabel('TIME (sec)')
xlim([0 10])
ylim([-1.2 1.2])



