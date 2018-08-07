function entryWindowBrowse(source,~,fieldname)
    
    gui = guidata(source);
    
    switch fieldname
        case 'aud'
            typestr = {'*.txt', 'Audio log files (*.txt)'};
        case 'Ca'
            typestr = {'*.txt', 'Ca imaging log files (*.txt)'};
        otherwise
            typestr = {'*.seq;*.avi;*.mp4','Movie files (*.seq;*.avi;*.mp4)'};
    end
    [FileName,PathName,~] = uigetfile({typestr{:};'*.*',  'All Files (*.*)'},'Pick a file');
    fname = [PathName FileName];
    if(FileName==0)
        return
    end
    
    gui.(fieldname).String = fname;
    formatSpec = 'yyyy-mm-dd HH:MM:SS.FFF';
    
    switch fieldname
        case 'aud'
        fid = fopen(fname);
        text = textscan(fid,'%s\t%s\t%s\t%s\t%s');
        fclose(fid);

        text = cellfun(@(x)x(2:end),text,'uniformoutput',false);
        text = text(2:end);
        nmice = length(unique(text{4}));
        if(nmice>0)
            gui.audDD.Visible = 'on';
            gui.audDD.String = unique(text{4});
        else
            gui.audDD.Visible = 'off';
        end
        tEvent = datetime([text{1}{1} ' ' text{2}{1}],'InputFormat','yyyyMMdd HH:mm:ss.SSS');
        tStart = tEvent - seconds(str2num(text{3}{1}));
        tString = datestr(tStart,formatSpec);
        
        case 'Ca'
            fid = fopen(fname);
            text = textscan(fid,'%s','Delimiter','\n');
            fclose(fid);
            text = text{1};
            sessMarkers = find(~cellfun(@isempty,strfind(text,'began recording.')));
            sessions = text(sessMarkers);
            for i=1:length(sessions)
                temp = regexp(sessions{i},' ','split');
                sessions{i} = temp{end-2};
            end
            if(~isempty(sessions))
                gui.CaDD.Visible = 'on';
                gui.CaDD.String = sessions;
            else
                gui.CaDD.Visible = 'off';
            end
            tRow = text(sessMarkers(1)-1+find(~cellfun(@isempty,strfind(text(sessMarkers(1):end),'RECORD START:')),1,'first'));
            tRow = regexprep(tRow,'RECORD START: ','');
            tString = datestr(datetime(tRow{1},'InputFormat','MMM dd, yyyy hh:mm:ss.SSS a'),formatSpec);
            
        otherwise
            sr = seqIo(fname,'reader');
            ts = sr.getts();
            ts = datetime(ts(1),'convertfrom','posixtime','timezone','local');
            tString = datestr(ts,formatSpec);
    end
    gui.([fieldname 'T']).String = tString;
end