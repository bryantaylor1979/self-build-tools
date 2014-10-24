classdef BestPrice_Compare < handle
    properties (SetObservable = true)
        TargetProperty = 'Mustils_Lane';
        BenchMarkProperty = 'High_Piece_Crescent__Over';
        BenchMarkPrice
        DATASET_COMPARE = dataset([]);
        NewBuildComp = 1;
        NewBuildPriceComp
        AreaComp = [15000,30]; %15,000 compensation for 30 sq meters.
        AreaPriceDiff
        BedroomComp = 30000
        EnsuiteCompensation = 6000;
        BedDiff
        BedDiffPrice
        GarageComp = 5000;
        GarageDiff = 0
        PriceTrendComp
        PriceTrendCompensation
        
        TotalNumberOfDays
        TotalNumberOfMonths
        NumberOfDays
        NumberOfMonths
        NumberOfYears
        %                   3m,   6m,   1y,  2y,   3y,   4y,   5y
        HousePricesTrend = {'3m', '6m', '1y','2y', '3y', '4y', '5y'; ...
                            1.7,  6.8,  4.4, 6.9,  8.6,  20.1, 16.5};
        TargetPrice_Estimation
        BP_LUT_OBJ
    end
    properties (Hidden = true, SetObservable = true)
        TargetProperty_LUT
        BenchMarkProperty_LUT
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = BestPrice_Compare();
            ObjectInspector(obj)
        end
        function RUN(obj)
            %% Target
            % Build struct with info
            obj.BP_LUT_OBJ.PropertyName = obj.TargetProperty;
            obj.BP_LUT_OBJ.RUN();
            struct = obj.BuildStruct(obj.BP_LUT_OBJ,'PropertyName',[]);
            
            % append to the struct
            obj.BP_LUT_OBJ.PropertyName = obj.BenchMarkProperty;
            obj.BP_LUT_OBJ.RUN();
            struct = obj.BuildStruct(obj.BP_LUT_OBJ,'PropertyName',struct);                     
            obj.TargetPrice_Estimation = obj.PriceEstimation(struct);
            

            
            %%
            property = fieldnames(struct);
            attributes = fieldnames(struct.(property{1}));
            VAL1 = obj.BuildAttributeRow(struct,attributes,property{1});
            attributes = fieldnames(struct.(property{2}));
            VAL2 = obj.BuildAttributeRow(struct,attributes,property{2});
            
            obj.DATASET_COMPARE = dataset(  {attributes(2:end),'attr'}, ...
                                            {VAL1(2:end),property{1}}, ...
                                            {VAL2(2:end),property{2}});

        end
    end    
    methods (Hidden = true)
        function TargetPrice_Estimation = PriceEstimation(obj,struct)
            TargetPrice_Estimation = struct.(obj.BenchMarkProperty).Price;
            
            %% property rise compensation
            disp('House Price Rise Difference Comp')
            disp('================================')
            obj.PriceTrendComp = obj.GetHouseRiseEstimate;
            disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
            disp(['Date of Sale: ',obj.BP_LUT_OBJ.DateOfSale])
            disp(['Total Number Of Days: ',num2str(obj.TotalNumberOfDays)])
            disp(['Total Number Of Months: ',num2str(obj.TotalNumberOfMonths)])
            
            disp(['Time Since Purchase: ',num2str(obj.NumberOfYears),'y ',num2str(obj.NumberOfMonths),'m ',num2str(obj.NumberOfDays),'d'])
            disp(['HousePricesTrend: ',obj.HousePricesTrend{1,1},'  -> ',num2str(obj.HousePricesTrend{2,1}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,2},'  -> ',num2str(obj.HousePricesTrend{2,2}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,3},'  -> ',num2str(obj.HousePricesTrend{2,3}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,4},'  -> ',num2str(obj.HousePricesTrend{2,4}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,5},'  -> ',num2str(obj.HousePricesTrend{2,5}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,6},'  -> ',num2str(obj.HousePricesTrend{2,6}),'%'])
            disp(['                  ',obj.HousePricesTrend{1,7},'  -> ',num2str(obj.HousePricesTrend{2,7}),'%'])
            disp(['Increase since sale: ',num2str(obj.PriceTrendComp),'%'])
            
            obj.PriceTrendCompensation = round(TargetPrice_Estimation*(obj.PriceTrendComp/100));
            TargetPrice_Estimation = TargetPrice_Estimation + obj.PriceTrendCompensation;
            disp(['Compensation Estimation: ',num2str(obj.PriceTrendCompensation)])
            disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
           
            disp(' ')
            disp(' ')
            

            
            %% EnsuiteCompensation
            if struct.(obj.TargetProperty).EnSuite == false
                if struct.(obj.BenchMarkProperty).EnSuite == true
                   disp('EnSuite Compensation')
                   disp('====================')
                   disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
                   disp(['Compensation Estimation: ',num2str(obj.EnsuiteCompensation)])
                   TargetPrice_Estimation = TargetPrice_Estimation - obj.EnsuiteCompensation;
                   disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
                end
            end
            disp(' ')
            
            %% Room Comp
            obj.BedDiff = struct.(obj.TargetProperty).NumberOfBedrooms-struct.(obj.BenchMarkProperty).NumberOfBedrooms;
            obj.BedDiffPrice = obj.BedDiff*obj.BedroomComp;
            disp('Bedroom Difference Comp')
            disp('=======================')
            if not(obj.BedDiff == 0)
               disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
               disp([obj.BenchMarkProperty,' of bedrooms: ',num2str(struct.(obj.BenchMarkProperty).NumberOfBedrooms)])
               disp([obj.TargetProperty,   ' of bedrooms: ',num2str(struct.(obj.TargetProperty).NumberOfBedrooms)])
               disp(['Compensation Estimation: ',num2str(obj.BedDiffPrice)])
               TargetPrice_Estimation = TargetPrice_Estimation + obj.BedDiffPrice;
               disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
            else
               disp('No compensation required')
            end
            disp(' ')
            
            
            %% Garage Comp
            disp('Garage Difference Comp')
            disp('=======================')
            if and(     struct.(obj.TargetProperty).Garage == false, ...
                        struct.(obj.BenchMarkProperty).Garage == true)
                disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
                disp([obj.BenchMarkProperty,' gargage: ',num2str(struct.(obj.TargetProperty).Garage)])
                TargetPrice_Estimation = TargetPrice_Estimation - obj.GarageComp; 
                obj.GarageDiff = obj.GarageComp;
                disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
            else
                disp('No compensation required')
            end
            disp(' ')
            
            %% Area Compensation
            disp('Property Area Comp')
            disp('======================')
            if isnan(struct.(obj.BenchMarkProperty).PropertyArea)
                disp('No compensation required')
            else
                disp([obj.TargetProperty,': ',num2str(struct.(obj.TargetProperty).PropertyArea),' m^2'])
                disp([obj.BenchMarkProperty,': ',num2str(struct.(obj.BenchMarkProperty).PropertyArea),' m^2'])
                AreaDiff = struct.(obj.TargetProperty).PropertyArea - struct.(obj.BenchMarkProperty).PropertyArea;
                disp(['Area Diff: ',num2str(AreaDiff),' m^2'])
                factor = AreaDiff/obj.AreaComp(2);
                obj.AreaPriceDiff = factor*obj.AreaComp(1);
                disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
                disp(['Compensation Estimation: ',num2str(obj.AreaPriceDiff)])
                TargetPrice_Estimation = TargetPrice_Estimation + obj.AreaPriceDiff;
                disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
            end
            disp(' ')
            
            %% New build comp
            
            obj.BenchMarkPrice = TargetPrice_Estimation;
            if struct.(obj.TargetProperty).NewBuild == true
               if struct.(obj.BenchMarkProperty).NewBuild == false
                   disp('New Build Comp')
                   disp('==============')
                   disp(['The property on ',obj.BenchMarkProperty,' is not a new build so we should add 10%'])
                   disp(['Property Price Estimation: ',num2str(TargetPrice_Estimation)])
                   obj.NewBuildPriceComp = round(TargetPrice_Estimation*(obj.NewBuildComp-1));
                   disp(['Compensation Estimation (',num2str(round((obj.NewBuildComp-1)*100)),'%): ',num2str(obj.NewBuildPriceComp)])
                   TargetPrice_Estimation = TargetPrice_Estimation + obj.NewBuildPriceComp;
                   disp(['New Estimation: ',num2str(TargetPrice_Estimation)])
                   disp(' ')
               end
            end
        end
        function obj = BestPrice_Compare()
            %% 
            
            obj.BP_LUT_OBJ = BestPrice_LUT; % load best price LUT. To look up details of property
            obj.TargetProperty_LUT =  obj.BP_LUT_OBJ.PropertyName_LUT; % Assign the property list to target
            obj.BenchMarkProperty_LUT =  obj.BP_LUT_OBJ.PropertyName_LUT; % Assign the property list to benchamark
        end
        function struct = BuildStruct(obj,OBJ,index_field,struct)
            names = fieldnames(OBJ);
            x = size(names,1);
            for i = 1:x
                val = OBJ.(names{i});
                Group = OBJ.(index_field);
                struct.(Group).(names{i}) = val;
            end            
        end
        function VAL = BuildAttributeRow(obj,struct,attributes,property)
            x = size(attributes,1);
            for i = 1:x
                VAL{i,1} = struct.(property).(attributes{i});
            end            
        end
        function PriceTrendComp = GetHouseRiseEstimate(obj)
            TODAY = round(now);
            NumberOfDays = TODAY - datenum(obj.BP_LUT_OBJ.DateOfSale);
            NumberOfMonths = floor(NumberOfDays/30);
            
            if NumberOfMonths > 12
                NumberOfYears = floor(NumberOfMonths/12);
                switch NumberOfYears
                    case 1
                        PriceTrendComp = obj.HousePricesTrend{2,3};
                    case 2
                        PriceTrendComp = obj.HousePricesTrend{2,4};
                    case 3
                        PriceTrendComp = obj.HousePricesTrend{2,5};
                    case 4
                        PriceTrendComp = obj.HousePricesTrend{2,6};
                    case 5
                        PriceTrendComp = obj.HousePricesTrend{2,7};
                end     
            else
                NumberOfYears = 0;
                if NumberOfMonths < 1
                    PriceTrendComp = 0;
                elseif NumberOfMonths < 4
                    PriceTrendComp = obj.HousePricesTrend{2,1};
                else
                    PriceTrendComp = obj.HousePricesTrend{2,2};
                end
            end
            obj.TotalNumberOfDays = NumberOfDays;
            obj.TotalNumberOfMonths = NumberOfMonths;
            obj.NumberOfMonths = rem(NumberOfMonths,12);
            
            obj.NumberOfDays = NumberOfDays - NumberOfYears*12*30 - obj.NumberOfMonths*30;
            obj.NumberOfYears = NumberOfYears;              
        end
    end
end