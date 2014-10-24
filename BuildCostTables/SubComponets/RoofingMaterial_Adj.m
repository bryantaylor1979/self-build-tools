classdef RoofingMaterial_Adj < handle
    properties (SetObservable = true)  % INPUTS
        MaterialType = 'Normal';
        ExpectedLevelOfSpecification = 'Standard'
        FloorArea = 120;
    end
    properties (SetObservable = true)  % OUTPUTS
        Base_CostPerSqMeter 
        Proposed_CostPerSqMeter
        Adj_CostPerSqMeter
        Total_Cost
        Additional_Cost
    end
    properties (Hidden = true)
        MaterialType_LUT = {    'Normal'; ...
                                'concrete interlocking tiles'; ...
                                'clay machine-made tiles'; ...
                                'plain clay tiles'; ...
                                'Welsh slate'; ...  
                                'Second-hand slates'; ...
                                'handmade clay tiles'; ...
                                'reed thatch'};
        ExpectedLevelOfSpecification_LUT = {    'Standard'; ...
                                                'Good'; ...
                                                'Excellent'};        
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = RoofingMaterial_Adj;
            ObjectInspector(obj)
        end
        function RUN(obj)    
            if strcmpi(obj.ExpectedLevelOfSpecification,'Standard')
                obj.Base_CostPerSqMeter = obj.RoofingMaterial_CostLUT('concrete interlocking tiles');
            elseif strcmpi(obj.ExpectedLevelOfSpecification,'Good')
                obj.Base_CostPerSqMeter = obj.RoofingMaterial_CostLUT('clay machine-made tiles');
            else
                obj.Base_CostPerSqMeter = obj.RoofingMaterial_CostLUT('plain clay tiles');
            end
            if strcmpi(obj.MaterialType,'Normal')
                obj.Proposed_CostPerSqMeter = obj.Base_CostPerSqMeter;
            else
                obj.Proposed_CostPerSqMeter = obj.RoofingMaterial_CostLUT(obj.MaterialType);
            end
            
            %roofing adjustments
            obj.Total_Cost = obj.Proposed_CostPerSqMeter*obj.FloorArea;
            obj.Adj_CostPerSqMeter = obj.Proposed_CostPerSqMeter - obj.Base_CostPerSqMeter;     
            obj.Additional_Cost = obj.FloorArea*obj.Adj_CostPerSqMeter;
        end
    end
    methods (Hidden = true)
        function obj = RoofingMaterial_Adj()
        end
        function Cost = RoofingMaterial_CostLUT(obj,Type)
            switch Type
                case 'plain clay tiles'
                    Cost = 45;
                case 'clay machine-made tiles'
                    Cost = 36;
                case 'concrete interlocking tiles'
                    Cost = 28;
                case 'Welsh slate'
                    Cost = 60;
                case 'Second-hand slates'
                    Cost = 35;
                case 'handmade clay tiles'
                    Cost = 65;
                case 'reed thatch'
                    Cost = 80;
            end
        end
        function Cost = RoofingMaterial_Baseline_LUT(obj,Type)
            switch Type
                case 'Standard'
                    Cost = 28;
                case 'Good'
                    Cost = 36;
                case 'Excellent'
                    Cost = 45;
            end
        end
    end
end