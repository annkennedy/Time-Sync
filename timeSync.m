
gui.h = figure(997);clf;

set(gui.h,'units','pixels','dockcontrols','off','menubar','none','NumberTitle','off','position',[300 300 800 400]);
fillinC = {'units','normalized','fontsize',11,'horizontalalign','center'};
fillinL = {'units','normalized','fontsize',11,'horizontalalign','left'};

uicontrol('style','text',fillinL{:},'position',[.025 .875 .95 .05],'string','Behavior videos:');
gui.vid1 = uicontrol('style','edit',fillinL{:},'position',[.05 .785 .6 .08],'string','');
uicontrol('style','pushbutton',fillinC{:},'position',[.66 .785 .04 .08],'string','...','callback',{'BrowseFile','vid1'});
gui.vid1T = uicontrol('style','edit',fillinC{:},'position',[.735 .785 .225 .08],'string','');
gui.vid2 = uicontrol('style','edit',fillinL{:},'position',[.05 .695 .6 .08],'string','');
uicontrol('style','pushbutton',fillinC{:},'position',[.66 .695 .04 .08],'string','...','callback',{'BrowseFile','vid2'});
gui.vid2T = uicontrol('style','edit',fillinC{:},'position',[.735 .695 .225 .08],'string','');


uicontrol('style','text',fillinL{:},'position',[.025 .625 .95 .05],'string','Ultrasonic recording:');
gui.aud = uicontrol('style','edit',fillinL{:},'position',[.05 .535 .6 .08],'string','');
uicontrol('style','pushbutton',fillinC{:},'position',[.66 .535 .04 .08],'string','...','callback',{'BrowseFile','aud'});
gui.audDD = uicontrol('style','popupmenu',fillinL{:},'position',[.05 .445 .6 .08],'string',' ','visible','off','callback','changeAudMouse');
gui.audT = uicontrol('style','edit',fillinC{:},'position',[.735 .535 .225 .08],'string','');

uicontrol('style','text',fillinL{:},'position',[.025 .375 .95 .05],'string','Miniscope data:');
gui.Ca = uicontrol('style','edit',fillinL{:},'position',[.05 .285 .6 .08],'string','');
uicontrol('style','pushbutton',fillinC{:},'position',[.66 .285 .04 .08],'string','...','callback',{'BrowseFile','Ca'});
gui.CaT = uicontrol('style','edit',fillinC{:},'position',[.735 .285 .225 .08],'string','');

uicontrol('style','pushbutton',fillinC{:},'position',[.3 .06 .4 .14],'string','Save timestamps','callback',@SaveTimeFile);
guidata(gui.h,gui);