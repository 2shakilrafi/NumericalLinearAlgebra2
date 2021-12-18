function abserrorcalculation

format long
i = 1:20
h = (10.^-i)
for j = 1:20
    y(j) = (sin(1.2+h(j))-sin(1.2-h(j)))/(2*h(j))
end
y
for k = 1:20
    abserror = abs(y(k)-cos(1.2))
end

semilogx(h,abserror,'*')
ylim([0.3,0.37])

end