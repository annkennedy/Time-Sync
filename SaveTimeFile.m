function SaveTimeFile(source,~)

    gui = guidata(source);
    vid1 = gui.vid1.String;
    vid2 = gui.vid2.String;
    aud  = gui.aud.String;
    Ca   = gui.Ca.String;

    str = {};
    if(~isempty(vid1))
        str = [str(:); {'Vid1:'};vid1;gui.vid1T.String;{''}];
    end
    if(~isempty(vid2))
        str = [str(:); {'Vid2:'};vid2;gui.vid2T.String;{''}];
    end
    if(~isempty(aud))
        str = [str(:); {'Audio:'};aud;gui.audT.String;{''}];
    end
    if(~isempty(Ca))
        str = [str(:); {'Ca file:'}; Ca; gui.CaT.String];
    end
    
    
    [FileName,PathName,~] = uiputfile({'*.txt', 'Text file (*.txt)'},'Save Timestamps','timestamps.txt');
    
    fname = [PathName FileName];
    fid = fopen(fname,'w');
    
    formatSpec = '%s\n';
    for row = 1:length(str)
        fprintf(fid,formatSpec,str{row});
    end
    fclose(fid);
end
