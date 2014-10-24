classdef  BestPrice <  handle
    % Best Price Estimation
    properties (SetObservable = true)
        NewBuildComp = 1.1;
        NumberOfProperties
        Target_PropertyName
        TargetPriceDataSet = dataset([]);
        Range = [NaN, NaN];
        Mean 
        RangeDiff = NaN;
        LUT
        BestPrice_Compare_OBJ
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            
            %%
            obj = BestPrice();
            obj.RUN()
            ObjectInspector(obj)          
        end
        function RUN(obj)
            %%
            x = size(obj.LUT,1) 
            for i = 2:x
                PropertyName = obj.LUT{i}
                obj.BestPrice_Compare_OBJ.BenchMarkProperty = PropertyName;
                obj.BestPrice_Compare_OBJ.NewBuildComp = obj.NewBuildComp;
                obj.BestPrice_Compare_OBJ.RUN();
                OrginalPrice(i-1,1) = obj.BestPrice_Compare_OBJ.BenchMarkPrice;
                NewBuildPriceComp(i-1,1) = obj.BestPrice_Compare_OBJ.NewBuildPriceComp;
                BedDiff(i-1,1) = obj.BestPrice_Compare_OBJ.BedDiff;
                BedRoomComp(i-1,1) = obj.BestPrice_Compare_OBJ.BedDiffPrice;
                %%
                GarageDiff(i-1,1) = obj.BestPrice_Compare_OBJ.GarageDiff; 
                %%
                TargetPrices(i-1,1) = obj.BestPrice_Compare_OBJ.TargetPrice_Estimation;
            end
            %%
            obj.TargetPriceDataSet = dataset(   {obj.LUT(2:end),'PropertyNames'}, ...
                                                {OrginalPrice,'OrginalPrice'}, ...
                                                {NewBuildPriceComp,'NewBuildPriceComp'}, ...
                                                {BedDiff,'NoBedDiff'}, ...
                                                {BedRoomComp,'BedRoomComp'}, ...
                                                {GarageDiff,'GarageDiff'}, ...
                                                {TargetPrices,'TargetPrice'})
            
            obj.NumberOfProperties = x - 1;
            obj.Range(2) = max(TargetPrices);
            obj.Range(1) = min(TargetPrices);
            obj.Mean = mean(TargetPrices);
            obj.RangeDiff =  obj.Range(2) -  obj.Range(1);
        end
    end
    methods (Hidden = true)
        function obj = BestPrice()
           obj.BestPrice_Compare_OBJ = BestPrice_Compare;
           obj.LUT = obj.BestPrice_Compare_OBJ.BP_LUT_OBJ.PropertyName_LUT;
           obj.Target_PropertyName = obj.LUT{1};
        end
    end
end
