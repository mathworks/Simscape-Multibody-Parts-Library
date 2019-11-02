Water Powered Lift
Copyright 2017-2018 The MathWorks, Inc.

This example models a water powered mechanical lift.  Water flowing from
a spout fills a bucket that is on the end of an arm.  When the bucket is
full, its weight causes it to drop, moving it away from the spout.  A
hole in the bottom of the bucket allows the water to drain.  As the water
drains, the bucket becomes lighter and a spring rotates the arm so that
the bucket is back under the spout.

The bucket is connected via a one-way clutch and a bevel gear to a lead
screw.  The lead screw is non-backdriveable. This combination of
mechanical elements enables the pouring water to lift a mechanical load.

This example uses a the General Variable Mass block from Simscape
Multibody to model the varying mass, inertia, and center of gravity
location in each bucket.  


Run >> startup_sm_water_powered_lift to get started.

