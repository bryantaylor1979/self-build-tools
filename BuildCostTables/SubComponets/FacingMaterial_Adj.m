classdef FacingMaterial_Adj <  handle
    properties (SetObservable = true)  % INPUTS
        MaterialType = 'Normal'; %normal same as declared in expected level of specification.
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
                                'facing_bricks_standard'; ...
                                'facing_bricks_good'; ...
                                'brick'; ...
                                'render_on_blockwork'; ...
                                'timber_cladding'; ...
                                'handmade_weather_tiling'; ...
                                'rubble walling/flint'; ...
                                'reconstituted_stone'; ...
                                'natural_stone'}; 
        ExpectedLevelOfSpecification_LUT = {    'Standard'; ...
                                                'Good'; ...
                                                'Excellent'};
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = FacingMaterial_Adj;
            ObjectInspector(obj)
        end
        function RUN(obj)
            if strcmpi(obj.ExpectedLevelOfSpecification,'Standard')
                obj.Base_CostPerSqMeter = obj.FacingMaterial_CostLUT('facing_bricks_standard');
            elseif strcmpi(obj.ExpectedLevelOfSpecification,'Good')
                obj.Base_CostPerSqMeter = obj.FacingMaterial_CostLUT('facing_bricks_good');
            else
                obj.Base_CostPerSqMeter = obj.FacingMaterial_CostLUT('brick');
            end
            if strcmpi(obj.MaterialType,'Normal')
                obj.Proposed_CostPerSqMeter = obj.Base_CostPerSqMeter;
            else
                obj.Proposed_CostPerSqMeter = obj.FacingMaterial_CostLUT(obj.MaterialType);
            end
            obj.Total_Cost = obj.Proposed_CostPerSqMeter*obj.FloorArea;
            obj.Adj_CostPerSqMeter = obj.Proposed_CostPerSqMeter - obj.Base_CostPerSqMeter;     
            obj.Additional_Cost = obj.FloorArea*obj.Adj_CostPerSqMeter;
        end
    end
    methods (Hidden = true)
        function obj = FacingMaterial_Adj()
            
        end
        function Cost = FacingMaterial_CostLUT(obj,Type)
            switch Type
                case 'facing_bricks_standard'
                    Cost = 45;
                case 'render_on_blockwork'
                    Cost = 25;
                case 'facing_bricks_good'
                    Cost = 56;
                case 'brick'
                    Cost = 67;
                case 'timber_cladding'
                    Cost = 25;
                case 'handmade_weather_tiling'
                    Cost = 54;
                case 'rubble walling/flint'
                    Cost = 90;
                case 'reconstituted_stone'
                    Cost = 48;
                case 'natural_stone'     
                    Cost = 75;
            end
        end
    end
end