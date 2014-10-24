classdef SlopingSite_Adj < handle
    properties (SetObservable = true) %INPUTS
        SlopingSite = 'no';
        Degrees = 5;
        FloorArea = 120;
    end
    properties (SetObservable = true) %OUTPUTS
        PricePerDegree = 10;
        AdjCostPerSqMeter
        Additional_Cost
    end
    properties (Hidden = true)
       SlopingSite_LUT = {  'yes'; ...
                            'no'};
    end
    methods
        function Example(obj)
           %%
           close all
           clear classes
           obj = SlopingSite_Adj;
           ObjectInspector(obj)
        end
        function RUN(obj)
           % sloping site adjustments
           if strcmpi(obj.SlopingSite,'yes')
               obj.AdjCostPerSqMeter = obj.Degrees*obj.PricePerDegree;
               obj.Additional_Cost = obj.AdjCostPerSqMeter * obj.FloorArea;
           else
               obj.AdjCostPerSqMeter = 0;
               obj.Additional_Cost = 0;
           end
        end
    end
    methods (Hidden  = true)
        function obj = SlopingSite_Adj()
        end
    end
end