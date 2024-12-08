a1 = 2;
a2 = 1;
q = [deg2rad(30) 0];
twolink = SerialLink([
    Revolute('d', 0, 'a', a1, 'alpha', 0, 'm', 1, 'r', [-0.5 0 0], 'I', [0 0 0], 'B', 0, 'G', 0, 'Jm', 0, 'standard')
    Revolute('d', 0, 'a', a2, 'alpha', 0, 'm', 1, 'r', [-0.5 0 0], 'I', [0 0 0], 'B', 0, 'G', 0, 'Jm', 0, 'standard')
], 'name', 'two link');

twolink;
twolink.teach();
Tfk = twolink.fkine(q);
ql = twolink.ikine(Tfk,'mask',[1 1 0 0 0 0]);
J0 = twolink.jacob0(q)
