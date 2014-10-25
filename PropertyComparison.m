classdef PropertyComparison <  handle
    properties (SetObservable = true)
        RootPath = 'C:\git\self-build-tools\';
        Enable_MortgageLoan_Estimator = false;
        Manual_EstimateProjectBudget = 350000;
        BuildContingency = 0.06; %
        TargetMargin = 0.30; %
        MaxDistance = Inf;
        FilterOnProjectBudget = 'no';
        EstimateProjectBudget
        FilterOnAvailable = 'yes';
        BuildCost_BuildRoute = 'D';
        DATASET = dataset([])
        LUT_OBJ
        MortgageEstimator_OBJ
        PropertyNames
    end
    properties (Hidden = true, SetObservable = true)
       handles 
       BuildCost_BuildRoute_LUT = { 'A'; ...
                                    'B'; ...
                                    'C'; ...
                                    'D'};
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            %%
            obj = PropertyComparison('RootPath','C:\git\self-build-tools\')
            %%
            ObjectInspector(obj)
        end
        function RUN(obj)
            if obj.Enable_MortgageLoan_Estimator == true
                obj.MortgageEstimator_OBJ.RUN(); 
                obj.EstimateProjectBudget = obj.MortgageEstimator_OBJ.EstimateProjectBudget; 
            else
                obj.EstimateProjectBudget = obj.Manual_EstimateProjectBudget
            end
            NAMES = {   'Name'; ...
                        'Available'; ...
                        'SalePrice'; ...
                        'Distance'; ...
                        'LandCost'; ...
                        'SalePrice'; ...
                        'Margin_Perc'; ...
                        'Profit_Pounds'; ...
                        'ProjectCost'; ...
                        'BuildCost'};
            struct = obj.GetValues(obj.LUT_OBJ,obj.PropertyNames,NAMES);  
            DATASET = obj.CreateDATASET(struct);
            obj.DATASET = obj.handles.DataSetFiltering2.NumRange(DATASET,'Distance',[0,obj.MaxDistance]);
            
            if strcmpi(obj.FilterOnProjectBudget,'yes')
                %%
                EstimatedProjectCost_Single = obj.handles.DataSetFiltering2.GetColumn(obj.DATASET,'ProjectCost');
                n = find(isnan(EstimatedProjectCost_Single));
                NAN = obj.DATASET(n,:);
                obj.DATASET = [NAN;obj.handles.DataSetFiltering2.NumRange(obj.DATASET,'ProjectCost',[0,obj.EstimateProjectBudget])];
            end
            obj.DATASET = obj.handles.DataSetFiltering2.ColumnStr(obj.DATASET,'Available',obj.FilterOnAvailable)
        end
    end
    methods (Hidden = true)
        function obj = PropertyComparison(varargin)
            %%
            x = size(varargin,2);
            for i = 1:2:x
               obj.(varargin{i}) = varargin{i+1};
            end
            obj.handles.DataSetFiltering2 = DataSetFiltering2;
            if obj.Enable_MortgageLoan_Estimator == true
                obj.MortgageEstimator_OBJ = MortgageLoanEstimation;
            end
            obj.LUT_OBJ = PropertySummary('RootPath',obj.RootPath)
            obj.PropertyNames = obj.LUT_OBJ.Name_LUT;
        end
        function struct = GetValues(obj,object,PropertyNames,NAMES)
            x = size(PropertyNames,1);
            y = size(NAMES,1);
            for i = 1:x
                obj.LUT_OBJ.Name = obj.LUT_OBJ.Name_LUT{i};
                obj.LUT_OBJ.RUN();  
                for j = 1:y
                    val = obj.LUT_OBJ.(NAMES{j})
                    ISNUM = isnumeric(val)
                    if ISNUM
                        if max(size(val)) > 1
                            struct.(NAMES{j}){i,1} = [num2str(val(1)),' x ',num2str(val(2))];
                        else
                            try
                            struct.(NAMES{j})(i,1) = val;
                            catch
                                NAMES{j}
                                error('')
                            end
                        end
                    else
                        struct.(NAMES{j}){i,1} = val;
                    end
                end
            end            
        end
        function N_DATASET = CreateDATASET(obj,struct)
            NAMES = fieldnames(struct);
            x = size(NAMES,1);
            for i = 1:x
                DATASET = dataset({struct.(NAMES{i}),NAMES{i}});
                if i == 1
                    N_DATASET = DATASET;
                else
                    N_DATASET = [N_DATASET,DATASET];
                end
            end           
        end
    end
end