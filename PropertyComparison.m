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
        Progress = [0,10];
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
            obj = PropertyComparison('RootPath','/home/imagequality/self-build-tools');
            obj.RUN()
            obj.DATASET
            %%
            close all
            clear classes
            obj = PropertyComparison('RootPath','C:\git\self-build-tools\');
            ObjectInspector(obj)
        end
        function RUN(obj)
            if obj.Enable_MortgageLoan_Estimator == true
                obj.EstimateProjectBudget = amzn_loan_estimation;
            else
                obj.EstimateProjectBudget = obj.Manual_EstimateProjectBudget;
            end
            NAMES = {   'Name'; ...
                        'Available'; ...
                        'SalePrice'; ...
                        'LandCost'; ...
                        'Margin_Perc'; ...
                        'Profit_Pounds'; ...
                        'ProjectCost'; ...
                        'BuildCost'};
             PropertyNames = {    'At 24 Hereward Close'; ...
						'Rampton, Cambridge'; ...
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
                        'Mustills Lane - Longstanton Rd - Over - Cambs'; ...
                        'Mustills Lane - New';
                        'Building Plot Rear Of - 143 High Street - Cottenham'};
            struct = obj.GetValues(PropertyNames,NAMES);  
            DATASET = obj.struct2dataset(struct);
            
            n = find(and(DATASET.Distance > 0,DATASET.Distance < obj.MaxDistance));
            obj.DATASET = DATASET(n,:);
            
            if strcmpi(obj.FilterOnProjectBudget,'yes')
                %%
                EstimatedProjectCost_Single = obj.DATASET.ProjectCost;
                n = find(isnan(EstimatedProjectCost_Single));
                NAN = obj.DATASET(n,:);
                obj.DATASET = [NAN;obj.handles.DataSetFiltering2.NumRange(obj.DATASET,'ProjectCost',[0,obj.EstimateProjectBudget])];
            end
             
            n = strcmpi(obj.DATASET.Available, obj.FilterOnAvailable);
            obj.DATASET = obj.DATASET(n,:);
        end
    end
    methods (Hidden = true)
        function obj = PropertyComparison(varargin)
            %%
            x = size(varargin,2);
            for i = 1:2:x
               obj.(varargin{i}) = varargin{i+1};
            end
            if obj.Enable_MortgageLoan_Estimator == true
                obj.MortgageEstimator_OBJ = MortgageLoanEstimation;
            end
        end
        function struct = GetValues(obj,PropertyNames,NAMES)
            x = size(PropertyNames,1);
            y = size(NAMES,1);
            for i = 1:x
                obj.Progress = [i,x];
                drawnow;
                struct1 = PropertySummary(PropertyNames{i}, ...
                                    'RootPath',obj.RootPath);
                for j = 1:y
                    val = struct1.(NAMES{j});
                    ISNUM = isnumeric(val);
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
        function N_DATASET = struct2dataset(obj,struct)
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