function kodex_json_string = kodek_egm_import(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  kodex_json_string= IMPORTFILE1(FILENAME) reads data from text
%  file FILENAME for the default selection.  Returns the data as a
%  string array.
%
%  LAMAPLAT20210414113209 = IMPORTFILE1(FILE, DATALINES) reads data for
%  the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  LAMapLAT20210414113209 = importfile1("C:\Users\osheac\OneDrive\Documents\Wellcome Fellowship\Kodek_Hamburg\KodexArchive\2021-04-14_12-06-55_JH__2021-04-15_10-18-23\dump_state\MainEntry\LA_Map\LAT\LA_Map_LAT_2021-04-14_11-32-09.756761_0.json", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 21-Apr-2021 13:51:01

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 1);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = "";

% Specify column names and types
opts.VariableNames = "current_point1timestamp20210414_113209point_keyLA_Map_LAT_20210";
opts.VariableTypes = "string";

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "current_point1timestamp20210414_113209point_keyLA_Map_LAT_20210", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "current_point1timestamp20210414_113209point_keyLA_Map_LAT_20210", "EmptyFieldRule", "auto");

% Import the data
kodek_json_string = readmatrix(filename, opts);

end