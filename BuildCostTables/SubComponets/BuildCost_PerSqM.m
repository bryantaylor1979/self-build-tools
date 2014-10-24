classdef BuildCost_PerSqM < handle
    properties (SetObservable = true)
        FloorArea = 120;
        Mode = 'selfbuild';
        Manual_CostPerSqM = 1200;
        CostPerSqM
        TotalCost
    end
    properties (Hidden = true)
        Mode_LUT=   {   'manual';...
                        'selfbuild'; ...
                        'extention'; ...
                        'basement'};
    end
    methods 
        function Example(obj)
            %%
            close all
            clear classes
            obj = BuildCost_PerSqM();
            ObjectInspector(obj)
        end
        function RUN(obj)
            obj.Get_CostPerSqM();
            obj.CalcBuildCost();
        end
    end
    methods (Hidden = true)
        function Get_CostPerSqM(obj)
            switch obj.Mode
                case 'manual'
                    obj.CostPerSqM = obj.Manual_CostPerSqM; 
                case 'selfbuild'
                    obj.CostPerSqM = 1500;
                case 'extention'
                    obj.CostPerSqM = 2000;
                case 'basement'
                    obj.CostPerSqM = 3200;
                otherwise
                    error('mode not recognised')  
            end      
        end
        function CalcBuildCost(obj)
            %%
            obj.TotalCost = obj.FloorArea*obj.CostPerSqM;
        end
        function obj = BuildCost_PerSqM()
        end
    end
end