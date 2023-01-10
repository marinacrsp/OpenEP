classdef importCartoMemMissingChannelTest < matlab.unittest.TestCase

    % ensure to set environment variable first before running this test: 
    % setenv('OPENEP_LOCAL_TESTING_DATA', '/path/to/openep-local-testingdata')

    properties
        userdata;
    end

    methods (Static)

        function carto = loadCarto(study_file, map, refchannel, ecgchannel)
            study_file = fullfile(getenv("OPENEP_LOCAL_TESTING_DATA"), study_file);
            carto = importcarto_mem( ...
                study_file, ...
                'maptoread', map, ...
                'refchannel', refchannel, ...
                'ecgchannel', ecgchannel, ...
                'savefilename', fullfile(getenv("OPENEP_LOCAL_TESTING_DATA"), 'tmp') ...
                );
        end

    end

    methods (Test)

        function loadMissingChannels(testCase)
            testCase.userdata = importCartoMemMissingChannelTest.loadCarto( ...
                'Carto/Export_Study-1-01_01_2030-18-01-20/Study 1 01_01_2030 18-01-20.xml', ...
                '1-LV_TC_SR', ...
                'M2', ...
                'M4' ...
                );
        end

        function ignoreMissingChannels(testCase)

            error_identifier = 'OPENEP:missingChannel';
            verifyError( ...
                testCase, ...
                @() importCartoMemMissingChannelTest.loadCarto( ...
                    'Carto/Export_Study-1-01_01_2030-18-01-20/Study 1 01_01_2030 18-01-20.xml', ...
                    '1-LV_TC_SR', ...
                    'M2', ...
                    'M7'), ...  % channel missing in some points
                error_identifier);

        end

    end

end