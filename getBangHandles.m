function handles = getBangHandles2(bangDAQ, info)
%This function sets up the Bhangmeter GUI.  It is called by Bhangmeter.m
%bangDAQ is the data acquisition handle needed for the interface between
%the computer and the electronics box created by Parris.

%Set up a handle structure.
handles = struct;

%Set up a parent gui for the program.
fig = uifigure;

%Give it a name.
fig.Name = 'BangMeter';

%Give it a position.
left = info.parentLeft;
bottom = info.parentBottom;
width = info.parentWidth;
height = info.parentHeight;

fig.Position = [left bottom width height];

%Now put the parameters into the handle structure.
handles.params = info.params;

%Here we set up the various panels.  These need the original parent gui
%handle.
handles.pulsePairs = getPulsePairs(handles, fig, bangDAQ, info);
handles.sineWave = getSineWave(handles, fig, bangDAQ, info);
handles.squareWave = getSquareWave(handles, fig, bangDAQ, info);
handles.sawtoothWave = getSawtoothWave(handles, fig, bangDAQ, info);
handles.utilities = getUtilities(fig, bangDAQ);

%Store the handle structure in the application data of the figure object.
guidata(fig, handles);

end  %End of the function getBangHandles1.m