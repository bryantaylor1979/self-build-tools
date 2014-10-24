classdef BuildCosts <  handle
    properties (SetObservable = true)
        Path = 'C:\sourcecode\selfBuild\BuildCosts\BuildCostTables\SubComponets\';
        filename = 'AverageBuildCostTables.xlsx';
        BuildRoute = 'D';
        Location = 'South-East'
        ExpectedLevelOfSpecification = 'Standard'
        FloorArea = 120;
        NumberOfStories = 2;
        CostPerSqMeter
        BuildCost
    end
    properties (Hidden = true)
        Location_LUT = {    'Greater London'; ...
                            'South-East'; ...
                            'NW, SW, East & Scotland'; ...
                            'Mids, Yorks, NE & Wales'};
        ExpectedLevelOfSpecification_LUT = {    'Standard'; ...
                                                'Good'; ...
                                                'Excellent'};
        Storey_LUT = {  'Single'; ...
                        'Two'};
        BuildRoute_LUT = {  'A'; ...
                            'B'; ...
                            'C'; ...
                            'D'}; 
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = BuildCosts
            ObjectInspector(obj)
        end
        function RUN(obj)
            %%
            raw = obj.ReadXLS('AverageBuildCostTables.xlsx');  
            Val = obj.LUT_Table(    raw, ...
                                    obj.NumberOfStories, ...
                                    obj.FloorArea, ...
                                    obj.BuildRoute, ...
                                    obj.Location, ...
                                    obj.ExpectedLevelOfSpecification);
            obj.BuildCost = Val*obj.FloorArea;
            obj.CostPerSqMeter = Val;
        end
    end
    methods (Hidden = true)
        function obj = BuildCosts()
        end
        function Val = LUT_Table(obj,raw,NumberOfStories,FloorArea,BuildRoute,Location,ExpectedLevelOfSpecification)
            %% decode number of stories
            if NumberOfStories == 2
                DATA = raw(18:31,:); 
            elseif NumberOfStories == 1
                DATA = raw(1:14,:);
            end
            
            %% Extract cost base on floor area
            [Range, RangeDATA] = obj.ExtractFloorRange(DATA,FloorArea);

            
            %% Extract based on build route
            DATA2 = obj.ExtractBuildRoute(RangeDATA,BuildRoute);
            
            %% Extract based on area
            DATA3 = obj.ExtractArea(DATA2,Location);
            
            %% Extract based on standard
            Val = obj.ExtractBasedStandard(DATA3,ExpectedLevelOfSpecification);            
        end
        function raw = ReadXLS(obj,filename)
            [raw] =  xlsread(   [obj.Path,obj.filename] );
        end
        function [Range, RangeDATA] = ExtractFloorRange(obj,singlestorey,FloorArea)
            %% extract ranges
            Range1 = singlestorey(1,1:2);
            Range2 = singlestorey(6,1:2);
            Range3 = singlestorey(11,1:2);
            Range3(2) = Inf;
            if and(Range1(1) < FloorArea, Range1(2) > FloorArea)
               disp('range 1')
               Range = 1;
               RangeDATA = singlestorey(1:4,4:end);
               return
            end
            if and(Range2(1) < FloorArea, Range2(2) > FloorArea)
               disp('range 2')
               Range = 2;
               RangeDATA = singlestorey(6:9,4:end);
               return
            end
            if and(Range3(1) < FloorArea, Range3(2) > FloorArea)
                disp('range 3')
               RangeDATA = singlestorey(11:14,4:end);
               Range = 3;
               return
            end            
        end
        function DATA2 = ExtractBuildRoute(obj,RangeDATA,BuildRoute)
            switch BuildRoute
                case 'A'
                    DATA2 = RangeDATA(:, 1:3);
                case 'B'
                    DATA2 = RangeDATA(:, 5:7);
                case 'C'
                    DATA2 = RangeDATA(:, 9:11);
                case 'D'
                    DATA2 = RangeDATA(:, 13:15);
            end            
        end
        function DATA3 = ExtractArea(obj,DATA2,Location)
            n = find(strcmpi(obj.Location_LUT,Location));
            DATA3 = DATA2(n,:);
        end
        function Val = ExtractBasedStandard(obj,DATA3,ExpectedLevelOfSpecification)
            n = find(strcmpi(obj.ExpectedLevelOfSpecification_LUT,ExpectedLevelOfSpecification));
            Val = DATA3(1,n);            
        end
    end
end