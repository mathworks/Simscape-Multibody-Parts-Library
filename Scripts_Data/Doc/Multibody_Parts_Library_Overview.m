%% Simscape Multibody Parts Library: Overview
% 
% This library of parameterized parts accelerates the process of assembling
% multibody models.  It contains:
%
% # Library of parts parameterized through block masks
% # MATLAB functions to generate data defining part cross-sections
% # Example models showing how to assemble the parts into mechanisms
%
% The parts have a consistent interface (frame location and orientation)
% which makes it easy to assemble a set of simple solids together to make a
% more complex part.  Key parameters are provided in the block mask for
% geometry, material, and appearance.  
%
% Copyright 2017-2018 The MathWorks, Inc.

%% Visualization of Parts from Library (partial)
%
% 3D view of many of the parts in the Simscape Multibody Parts Library

%%
% <<sm_parts_all_mechanics_explorer.png>>

%% Extrusion Scripts: Box
%
% MATLAB function Extr_Data_Box.m creates a hollow or solid rectangular
% cross-section.  Parts Box Tube and Box Tube Curve use this function to
% define straight or curved extrusions that can be chained together.

Extr_Data_Box

%%
% <matlab:open_system('sm_parts_box_tubes'); Open model sm_parts_box_tubes.slx>

sm_parts_box_tubes

%%
% <<sm_parts_box_tubes_mechanics_explorer.png>>

%% Extrusion Scripts: Box with Fillets
%
% MATLAB function Extr_Data_BoxFillet.m creates a hollow or solid
% rectangular cross-section with fillets on the inner and outer corners.
% Parts Box Fillet Tube and Box Fillet Tube Curve use this function to
% define straight or curved extrusions that can be chained together.

Extr_Data_BoxFillet

%%
% <matlab:open_system('sm_parts_box_fillet_tubes'); Open model sm_parts_box_fillet_tubes.slx>

sm_parts_box_fillet_tubes

%%
% <<sm_parts_box_fillet_tubes_mechanics_explorer.png>>

%% Extrusion Scripts: Ellipse
%
% MATLAB function Extr_Data_Ellipse.m creates a hollow or solid elliptical
% cross-section.  Parts Elliptical Tube and Elliptical Tube Curve use this
% function to define straight or curved extrusions that can be chained
% together.

Extr_Data_Ellipse(5,2,60,315,0.5,'plot')

%%
% <matlab:open_system('sm_parts_ell_tubes'); Open model sm_parts_ell_tubes.slx>

sm_parts_ell_tubes

%%
% <<sm_parts_ell_tubes_mechanics_explorer.png>>


%% Extrusion Scripts: Ring
%
% MATLAB function Extr_Data_Ring.m creates a hollow or solid circular
% cross-section.  Parts Circular Tube and Circular Tube Curve use this
% function to define straight or curved extrusions that can be chained
% together.

Extr_Data_Ring

%%
% <matlab:open_system('sm_parts_circ_tubes'); Open model sm_parts_circ_tubes.slx>

sm_parts_circ_tubes

%%
% <<sm_parts_circ_tubes_mechanics_explorer.png>>


%% Extrusion Scripts: Custom
%
% MATLAB function Extr_Data_Custm.m plots custom cross-section data.
% Parts Custom Extrusion and Custom Extrusion Curve use this
% function to plot a cross-section defined in its UI.
%
% >> Extr_Data_Custom([-1 1;-1 -1;1 -1;0.5 -0.5;-0.5 -0.5;-0.5 0.5]*2e-2);

Extr_Data_Custom([-1 1;-1 -1;1 -1;0.5 -0.5;-0.5 -0.5;-0.5 0.5]*2e-2);

%%
% <matlab:open_system('sm_parts_custom_extrusion'); Open model sm_parts_custom_extrusion.slx>

sm_parts_custom_extrusion

%%
% <<sm_parts_custom_extrusion_mechanics_explorer.png>>


%% Extrusion Scripts: Mesh
%
% MATLAB function Extr_Data_Mesh.m creates a cross-section for a grid. Part
% Mesh uses this function to create a rectangular solid with rectangular
% holes.  This is useful for putting a brid n the background of your
% visualization for the floor or other planes.

Extr_Data_Mesh(0.6,0.4,6,4,0.095,0.095,'plot')

%%
% <matlab:open_system('sm_parts_mesh'); Open model sm_parts_mesh.slx>

sm_parts_mesh

%%
% <<sm_parts_mesh_mechanics_explorer.png>>


%% Extrusion Scripts: Link
%
% MATLAB function Extr_Data_LinkHoles.m creates a cross-section for a
% rectangular solid with rounded ends.  An arbitrary number of holes can be
% put in the part.  Part Link uses Extr_Data_LinkHoles.m to create a part.
% It can have an arbitrary number of holes, but only provides interface
% ports at the end holes.  For links with more interface ports, assemble
% them from link segments.  
%
% The Link part is often combined with the Rod part to create mechanisms
% such as four-bar linkages. Note the port labels - the Rod ports connect
% to frames oriented so that they will extend away from the Link part, The
% port you connect determines the side of the link where the rod will
% appear.

Extr_Data_LinkHoles(0.1, 0.025, 0.005, 4,'plot');

%%
% <matlab:open_system('sm_parts_link'); Open model sm_parts_link.slx>

sm_parts_link

%%
% <<sm_parts_link_mechanics_explorer.png>>

%% Extrusion Scripts: Link Segment, 2 Holes
%
% MATLAB function Extr_Data_Link2Hole.m creates a cross-section for a
% segment of a mechanical link between two holes.  It is used by the Link
% Seg 2 Holes part which enables you to construct a mechanical link with an
% arbitrary number and location of holes and associated interface ports.
%
% The link part is often combined with the other Link Seg 2 Holes parts and
% Link End parts to create custom mechanical links.

Extr_Data_Link2Hole(0.05, 0.025, 0.005,'plot')

%%
% <matlab:open_system('sm_parts_custom_link'); Open model sm_parts_custom_link.slx>

sm_parts_custom_link

%%
% <<sm_parts_custom_link_mechanics_explorer.png>>

%% Extrusion Scripts: Link Segment, 1 Hole
%
% MATLAB function Extr_Data_Link1Hole.m creates a cross-section for a
% segment of a mechanical link with a hole at one end.  It is used by the
% Link Seg 1 Hole part which enables you to construct a mechanical link
% with an arbitrary number and location of holes and associated interface
% ports.  You can select which end of the link has the hole, either at the
% positive or negative end of the local X-axis.
%
% The link part is often combined with the other Link Seg 2 Holes parts and
% Link End parts to create custom mechanical links.

Extr_Data_Link1Hole

%%
% <matlab:open_system('sm_parts_custom_link_flatend'); Open model sm_parts_custom_link_flatend.slx>

sm_parts_custom_link_flatend

%%
% <<sm_parts_custom_link_flatend_mechanics_explorer.png>>

%% Extrusion Scripts: Cam from two Circles
%
% MATLAB function Extr_Data_Cam_Circles.m creates a cross-section formed
% by connecting two circles via two tangent lines.  It is similar to the
% shape of very simple cams.

Extr_Data_Cam_Circles

%%
% <matlab:open_system('sm_parts_cam_circles'); Open model sm_parts_cam_circles.slx>

sm_parts_cam_circles

%%
% <<sm_parts_cam_circles_mechanics_explorer.png>>

%% Extrusion Scripts: Gear
%
% MATLAB function Extr_Data_Gear.m creates a cross-section for an external
% or an internal toothed gear.
%

Extr_Data_Gear('internal',0.125*3,36,0.02,'plot');

%%
Extr_Data_Gear('external',0.125,12,0.005,'plot');

%%
% <matlab:open_system('sm_parts_gears'); Open model sm_parts_gears.slx>

sm_parts_gears

%%
% <<sm_parts_gears_mechanics_explorer.png>>

%% Extrusion Scripts: Rack
%
% MATLAB function Extr_Data_Rack.m creates a cross-section for a rack.
%

Extr_Data_Rack(pi*0.125/12,8,0.02,'plot');

%%
% <matlab:open_system('sm_parts_rack_and_pinion'); Open model sm_parts_rack_and_pinion.slx>

sm_parts_rack_and_pinion

%%
% <<sm_parts_rack_and_pinion_mechanics_explorer.png>>

%% Extrusion Scripts: Cone
%
% MATLAB function Extr_Data_Frustum.m creates a cross-section that can be revolved to create a conical solid.
%

Extr_Data_Frustum_Conical(37.5e-3,60,4e-2,30e-3,'plot');

%%
% <matlab:open_system('sm_parts_cone'); Open model sm_parts_cone.slx>

sm_parts_cone

%%
% <<sm_parts_cone_mechanics_explorer.png>>

%%

%clear all
close all
bdclose all
