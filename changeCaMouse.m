function changeCaMouse(source,~)

    gui=guidata(source);
    formatSpec = 'yyyy-mm-dd HH:MM:SS.FFF';

    fid = fopen(gui.Ca.String);
    text = textscan(fid,'%s','Delimiter','\n');
    fclose(fid);
    text = text{1};
        
    mousename = gui.CaDD.String{gui.CaDD.Value};
    ind = find(~cellfun(@isempty,strfind(text,mousename)),1,'first');
    
    tRow = text(ind-1+find(~cellfun(@isempty,strfind(text(ind:end),'RECORD START:')),1,'first'));
    tRow = regexprep(tRow,'RECORD START: ','');
    tString = datestr(datetime(tRow{1},'InputFormat','MMM dd, yyyy hh:mm:ss.SSS a'),formatSpec);
    
    gui.CaT.String = tString;
    
end