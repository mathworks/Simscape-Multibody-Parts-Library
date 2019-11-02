% Copyright 2018-2019 The MathWorks, Inc.
% Obtain driven pulley angles
sm_pulleys_xytable_cross_configmotion('sm_pulleys_xytable_cross','XY Position');
sim('sm_pulleys_xytable_cross');
qdt = simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P2.Measure.Revolute_P2.Rz.q.series.time;
qd2 = [qdt simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P2.Measure.Revolute_P2.Rz.q.series.values('deg')];
qd6 = [qdt simlog_sm_pulleys_xytable_cross.Pulleys.Revolute_P6.Measure.Revolute_P6.Rz.q.series.values('deg')];

save('sm_pulleys_xytable_cross_driveqs.mat','qd2','qd6');