function changeAudMouse(source,~)

    gui=guidata(source);

    fname = gui.aud.String;
    fid = fopen(fname);
    text = textscan(fid,'%s\t%s\t%s\t%s\t%s');
    fclose(fid);
    text = cellfun(@(x)x(2:end),text,'uniformoutput',false);
    text = text(2:end);
        
    mousename = gui.audDD.String{gui.audDD.Value};
    ind = find(strcmpi(text{4},mousename),1,'first');
    if(ind<length(text{4}))
        ind=ind+1;
    end
    
    tEvent = datetime([text{1}{ind} ' ' text{2}{ind}],'InputFormat','yyyyMMdd HH:mm:ss.SSS');
    tStart = tEvent - seconds(str2num(text{3}{ind}));
    tString = datestr(tStart,formatSpec);
    
    gui.audT.String = tString;
end