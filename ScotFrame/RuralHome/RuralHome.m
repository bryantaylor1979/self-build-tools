classdef RuralHome <  handle
    properties (SetObservable = true)
        filename = 'RuralHome_PriceGuide.xlsx';
        Path = 'C:\sourcecode\selfBuild\BuildCosts\ScotFrame\RuralHome\';
        DATASET = dataset()
    end
    methods
        function Example(obj)
            %% 
            close all
            clear classes
            
            %%
            obj = RuralHome;
            ObjectInspector(obj)
        end
        function RUN(obj)
            obj.ReadFile()
        end
    end
    methods (Hidden = true)
        function obj = RuralHome()
            
        end
        function ReadFile(obj)
            %% 
            [data, raw] = xlsread(fullfile(obj.Path,obj.filename));
            
            %%
            HouseName = raw(2:end,1);
            NumberOfBedroomsStr = raw(2:end,2);
            Area_MeterSq = data(1:end,1);
            Area_FeetSq = data(1:end,2);
            Frontage_Meters = data(1:end,3);
            Price = data(1:end,5);
            
            obj.DATASET = dataset(    {HouseName,'HouseName'}, ...
                        {NumberOfBedroomsStr,'NumberOfBedroomsStr'}, ....
                        {Area_MeterSq,'Area_MeterSq'}, ...
                        {Area_FeetSq,'Area_FeetSq'}, ...
                        {Frontage_Meters,'Frontage_Meters'}, ...
                        {Price,'Price'})
        end
    end
end
% http://www.scotframe.co.uk/web/site/SelfBuild/HomesPortfolio/Bungalows/Bungalows.asp