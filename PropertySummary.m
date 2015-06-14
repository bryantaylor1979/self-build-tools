function struct = PropertySummary(varargin)
    Name = varargin{1};
    
    % defaults
    args.RootPath = '/home/imagequality/self-build-tools'
    args.Contingency = 0.06; %NOT linked.
    
    % optional inputs overwrites
    varargin = varargin(2:end);
    x = size(varargin,2);
    for i = 1:2:x
       args.(varargin{i}) = varargin{i+1};
    end
    
    
    %%
    landdetails = PropertiesDetails(Name);
    
    struct.Name = Name;
    struct.SalePrice = landdetails.SalePrice;
    struct.LandCost = landdetails.Price;
    struct.Available = landdetails.Available;
    struct.ExtraCosts = landdetails.AddtionalRequiredCosts;
    struct.Distance = landdetails.Distance;
    
    %%
    ProjectCost_OBJ = ProjectCostEstimater( 'RootPath', args.RootPath, ...
                                            'SalePrice',landdetails.SalePrice, ...
                                            'LandCost', landdetails.Price, ...
                                            'ExtraCost',landdetails.AddtionalRequiredCosts)
    ProjectCost_OBJ.Name = Name;
    ProjectCost_OBJ.Contingency = args.Contingency;
    ProjectCost_OBJ.RUN();
    struct.Margin_Perc = ProjectCost_OBJ.Margin_Perc;
    struct.Profit_Pounds = ProjectCost_OBJ.Profit_Pounds;
    struct.ProjectCost = ProjectCost_OBJ.ProjectCost;
    struct.BuildCost = round(ProjectCost_OBJ.BuildCost);
    struct.TargetLandCost = ProjectCost_OBJ.TargetLandCost;

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
function Example(obj)
    %%
    close all
    clear classes
    
    %%
    struct = PropertySummary('Mustills Lane - New')
    
   %%
    struct = PropertySummary('Mustills Lane - Longstanton Rd - Over - Cambs')
end