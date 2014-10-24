classdef MetricConversions < handle
    % METRICCONVERSIONS
    % =================
    % Convert between ft2, m2, and acres
    properties (SetObservable = true)
        mode = 'ft2_to_m2';
        input_val = 1300;
        output_val = NaN;
    end
    properties (Hidden = true, SetObservable = true)
        mode_LUT = {'ft2_to_m2'; ...
                    'ft_to_m'; ...
                    'Acres_to_m2'};
    end
    methods 
        function Example(obj)
            %%
            close all
            clear classes
            obj = MetricConversions;
            

            %%
            obj.mode = 'ft2_to_m2';
            obj.input_val = 1300; %ft^2
            obj.RUN;

            %%
            obj.mode = 'ft_to_m';
            obj.input_val = 55; %ft^2
            obj.RUN

            %%
            obj.mode = 'Acres_to_m2';
            obj.input_val = 0.065; %ft^2
            obj.RUN
        end
        function RUN(obj)
            obj.(obj.mode)
        end
    end
    methods (Hidden = true)
        function obj = MetricConversions()
        end
        function ft2_to_m2(obj)
        %% ft2 to m2
        obj.output_val = obj.input_val/10.764;
        end
        function ft_to_m(obj)
        %% ft to m
        obj.output_val = obj.input_val/3.2808
        end
        function Acres_to_m2(obj)
        %% acres to m2  
        obj.output_val = obj.input_val/0.00024711
        end
    end
end
