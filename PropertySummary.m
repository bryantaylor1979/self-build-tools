classdef PropertySummary < handle
    % PROPERTYSUMMARY
    % ===============
    %
    % Summary of cost of a single plot
    % All plots that have been registered are available. (Look at
    % Avalaible property) 
    %
    % Properties
    % Contingency:  Add contigency into the plan
    % LandCost:     Price of the land
    % SalePrice:    Price predicted to sell when completed to plans
    % Distance:     Distance from work
    % Margin_Perc:  Calculated margin
    % Profit_Pounds:Predicted Profit in the project.
    % ProjectCost:  Total cost of Build + Land + Extras
    % BuildCost:    The total cost of the building
    % ExtraCosts:   Any Extra Cost
    %
    % Sub Componets: ProjectCostEstimater, PropertiesDetails_LUT
    properties (SetObservable = true)
        INPUTS
        Name = 'Isaacson Road - Burwell';
        Contingency = 0.06; %NOT linked.
        OUTPUTS
        Available
        LandCost = 130000
        SalePrice = 400000
        Distance
        Margin_Perc
        Profit_Pounds
        ProjectCost
        BuildCost
        ExtraCosts
        OBJECTS
        ProjectCost_OBJ
        PropertiesDetails_LUT
    end
    properties (Hidden = true, SetObservable = true)
        Name_LUT = [];        
    end
    methods 
        function Example(obj)
            %%
            close all
            clear classes
            obj = PropertySummary()
            ObjectInspector(obj)
        end
        function RUN(obj)
            %%
            obj.PropertiesDetails_LUT.Name = obj.Name;
            obj.PropertiesDetails_LUT.RUN();
            obj.SalePrice = obj.PropertiesDetails_LUT.SalePrice;
            obj.LandCost = obj.PropertiesDetails_LUT.Price;
            obj.Available = obj.PropertiesDetails_LUT.Available;
            obj.ExtraCosts = obj.PropertiesDetails_LUT.AddtionalRequiredCosts;
            %%
            obj.Distance = obj.PropertiesDetails_LUT.Distance;
            obj.ProjectCost_OBJ.Name = obj.Name;
            obj.ProjectCost_OBJ.Contingency = obj.Contingency;
            obj.ProjectCost_OBJ.LandCost = obj.LandCost;
            obj.ProjectCost_OBJ.SalePrice = obj.SalePrice;
            obj.ProjectCost_OBJ.ExtraCost = obj.PropertiesDetails_LUT.AddtionalRequiredCosts;
            obj.ProjectCost_OBJ.RUN();
            obj.Margin_Perc = obj.ProjectCost_OBJ.Margin_Perc;
            obj.Profit_Pounds = obj.ProjectCost_OBJ.Profit_Pounds;
            obj.ProjectCost = obj.ProjectCost_OBJ.ProjectCost;
            obj.BuildCost = round(obj.ProjectCost_OBJ.BuildCost);
            
        end
    end
    methods (Hidden = true)
        function obj = PropertySummary()
            %%
            obj.ProjectCost_OBJ = ProjectCostEstimater;
            obj.PropertiesDetails_LUT = PropertiesDetails_LUT;
            obj.Name_LUT = obj.PropertiesDetails_LUT.Name_LUT;
        end
        function LandDetails = CalcPlotSize(obj,LandDetails)
            if not(isnan(LandDetails.Dimensions_Meters(1)))
                LandDetails.PlotArea = round(LandDetails.Dimensions_Meters(1)*LandDetails.Dimensions_Meters(2));
            end
%             LandDetails.BuildCost_HouseFloorArea = round(LandDetails.BuildCost_HouseFloorArea);
            LandDetails.Dimensions_Meters = round(LandDetails.Dimensions_Meters.*10)./10;
            
            obj.OBJ_BC_Adj.Name = LandDetails.Name;
            obj.OBJ_BC_Adj.RUN();
            LandDetails.BuildCost_TotalCost = obj.OBJ_BC_Adj.Total_BuildCost;
            
            LandDetails.PoundsPerSqM = LandDetails.Price/LandDetails.PlotArea;
        end
    end
end