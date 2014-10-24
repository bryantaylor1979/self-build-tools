classdef CeilingHeight_Adj < handle
    properties (SetObservable = true)
        %Ceiling Height
        Ceiling_Height = 2.4; % m
        BuildCost = 130000
        
        
        Standard_Height = 2.4;
        Addtional_Height
        Additional_HeightUnit = 0.1;
        PercetPerDistance = 0.01; % 1% per £/m
        Additional_NumberOfUnits
        Additional_PercentageIncrease
        Additional_Cost
    end
    methods
        function Example(obj)
            %% 
            close all
            clear classes
            obj = CeilingHeight_Adj;
            ObjectInspector(obj)
        end
        function RUN(obj)
            %%
           % ceiling height
           obj.Addtional_Height = obj.Ceiling_Height - obj.Standard_Height; % m  
           obj.Additional_NumberOfUnits = obj.Addtional_Height/obj.Additional_HeightUnit;
           
           obj.Additional_PercentageIncrease = obj.Additional_NumberOfUnits*obj.PercetPerDistance;
           obj.Additional_Cost = obj.Additional_PercentageIncrease*obj.BuildCost;
        end
    end
    methods (Hidden = true)
        function obj = CeilingHeight_Adj() 
        end
    end
end