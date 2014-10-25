classdef ProjectCostEstimater < handle
    % PROJECTCOSTESTIMATER
    % ====================
    % 
    % Description
    % Summary of project costs only.
    %
    % Sub Components: BuildCosts_withAdj
    properties (SetObservable = true)
       INPUTS
       RootPath = 'C:\git\self-build-tools\'
       Name = 'The Willows - Highfields Caldecote';
       Contingency = 0.06;
       LandCost = 130000
       StampDuty
       SalePrice = 400000
       TargetMargin = 0.2;
       ExtraCost = 0;
       OUTPUTS
       BuildCost
       ProjectCost
       Profit_Pounds
       Margin_Perc
       TargetProfit_Pounds
       TargetLandCost
       OBJECTS
       BuildCost_OBJ
       StampDutyCalculator_OBJ
    end
    properties (Hidden = true, SetObservable = true)
       Name_LUT = {     'Rampton, Cambridge'; ...
                        'Isaacson Road - Burwell'; ...
                        'Land for sale - Building Plot at New Road'; ...
                        'Great Cambourne'; ...
                        'Mill Corner Soham'; ...
                        'Mereside - Soham - Plot1'; ...
                        'Mereside - Soham - Plot2'; ...
                        'Isleham - Robin Close'; ...
                        'Gibraltar Lane'; ...
                        'Lambs Lane - Cottenham'; ...
                        'Haslingfield'; ...
                        'The Willows - Highfields Caldecote'; ...
                        'Mill Lane - Exning - Plot1'; ...
                        'Mill Lane - Exning - Plot2'; ...
                        'Land for sale - Exning'; ...
                        'Meadow Lane - Earith'; ...
                        'Mustills Lane - Longstanton Rd - Over - Cambs'};
    end
    methods
        function Example(obj)
            %%
            close all 
            clear classes
            obj = ProjectCostEstimater;
            ObjectInspector(obj)            
        end
        function RUN(obj)
            %%
            obj.BuildCost_OBJ.Name = obj.Name;
            obj.BuildCost_OBJ.RUN();
            obj.BuildCost = obj.BuildCost_OBJ.Total_BuildCost;
            
            obj.StampDutyCalculator_OBJ.Price = obj.LandCost;
            obj.StampDutyCalculator_OBJ.RUN();
            obj.StampDuty = obj.StampDutyCalculator_OBJ.StampDuty;

            obj.ProjectCost = round((obj.BuildCost)*(1 + obj.Contingency) + obj.LandCost + obj.StampDuty + obj.ExtraCost);
            obj.Profit_Pounds = obj.SalePrice - obj.ProjectCost;
            obj.Margin_Perc = round(obj.Profit_Pounds/obj.ProjectCost*100);
            obj.TargetProfit_Pounds = round(obj.SalePrice - obj.SalePrice/(1+obj.TargetMargin));
            obj.TargetLandCost = round(obj.SalePrice - obj.BuildCost*(1+obj.Contingency) - obj.TargetProfit_Pounds);
        end
    end
    methods (Hidden = true)
        function obj = ProjectCostEstimater(varargin)
            x = size(varargin,2);
            for i = 1:2:x
               obj.(varargin{i}) = varargin{i+1};
            end
            obj.BuildCost_OBJ = BuildCosts_withAdj('RootPath',obj.RootPath);
            obj.StampDutyCalculator_OBJ = StampDutyCalculator();
        end
    end
end