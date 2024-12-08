L1 = 1; % ระยะเลื่อนสูงสุดของข้อต่อ Prismatic
L2 = 1; % ความยาว link ที่อยู่ถัดไป
L3 = 1; % ความยาว link ของข้อต่อหมุน
q = [0.5 deg2rad(30)]; % การตั้งค่าข้อต่อเริ่มต้น: d สำหรับ Prismatic และ theta สำหรับ Revolute

% สร้างโมเดลหุ่นยนต์สองข้อต่อ
twolink = SerialLink([
    Prismatic('theta', 0, 'a', L2, 'alpha', deg2rad(90), 'qlim', [0 L1], 'm', 1, 'r', [0 0 0], 'I', [0 0 0], 'B', 0, 'G', 0, 'Jm', 0)
    Revolute('d', 0, 'a', L3, 'alpha', deg2rad(-90), 'm', 1, 'r', [0 0 0], 'I', [0 0 0], 'B', 0, 'G', 0, 'Jm', 0)
], 'name', 'two link');

% แสดงโมเดล
twolink.teach()

% คำนวณ Forward Kinematics
Tfk = twolink.fkine(q)

% คำนวณ Inverse Kinematics โดยใช้ mask สำหรับข้อต่อที่ต้องการ
ql = twolink.ikine(Tfk, 'mask', [1 1 0 0 0 0])

% คำนวณ Jacobian Matrix
J0 = twolink.jacob0(q)