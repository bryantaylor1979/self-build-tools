classdef StampDutyCalculator <  handle
    % Stamp Duty
    %
    % Stamp duty rates on UK property transactions are linked to the 
    % property selling price.
    % The rate of stamp duty chargeable is a percentage of the final 
    % transaction cost, and is payable by the purchaser. Stamp duty rates 
    % increase in line with property value and there are a number of stamp 
    % duty thresholds giving clear demarcation between the different rates. 
    % Stamp duty rates are different for residential and commercial 
    % property.
    %
    %
    % Stamp duty rates for first time buyers
    %
    % New stamp duty rates were  introduced by the government for first 
    % time buyers designed to help boost the housing market and to make it 
    % less expensive for individuals to step onto the property ladder.
    % Effective from April 2010 for two years, stamp duty was waived for 
    % first time buyers for property transactions under £250,000. The new 
    % first time buyer rate was a temporary measure and was withdrawn on 
    % 24th March 2012.
    %
    %
    % Higher Stamp duty rates for more expensive homes
    % 
    % To finance the cut in the stamp duty rate for first time buyers, the 
    % government  increased the rate for more expensive homes. A newer 
    % higher stamp duty rate of 5% was be introduced from April 2011 for 
    % property being sold for over £1 Million. After the 2012 budget the 
    % highest rate of 7% has been introduced for property transactions 
    % exceeding £2 Million.
    %
    %
    % Stamp duty rates in disadvantaged areas
    %
    % Nearly 2000 areas in the UK qualify for disadvantaged SDLT relief, 
    % reducing the stamp duty rate for the lower thresholds. Disadvantaged 
    % Areas Relief has now been abolished and any claims for DAR relief 
    % must be made on or before 5 May 2014.
    %
    % If a property qualifies for SDLT relief and  is sold for less than 
    % £150,000 then no stamp duty is payable. Please see the table below 
    % for more information.
    %
    %
    % Reduce Carbon
    %
    % In October 2007 the government introduced an SDLT exemption for 
    % homes which have minimal impact on the environment. Zero carbon 
    % homes under £500,000 are now exempt from SDLT, and zero carbon 
    % homes bought for over £500,000 will have a reduced SDLT liability.
    %
    % To qualify for SDLT exemption, a house needs to be built to high 
    % standards with superior insulation and will normally incorporate a 
    % source of renewable energy. A qualifying home will need to be carbon 
    % neutral over the course of a year.


    properties  (SetObservable = true)
        Normal_LUT = dataset([])
        DisAdv_LUT = dataset([])
        Price = 135000;
        Precentage
        Area = 'Normal'
        StampDuty
    end
    properties (Hidden = true)
        Area_LUT = {    'Normal'; ...
                        'Disadvantaged'};
    end
    %TODO: £2,000,001 and over (purchased by companies collective
    %investment schemes and partnerships). Rate is 15%
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = StampDutyCalculator();
            ObjectInspector(obj);
        end
        function RUN(obj)
            %%
            if strcmpi(obj.Area,'Normal')
                DATASET = obj.Normal_LUT
            else
                DATASET = obj.DisAdv_LUT;
            end
            Max = DATASET.Max;
            n = find(obj.Price <= Max == 1);
            obj.Precentage = DATASET.Percentage(n(1));
            
            obj.StampDuty = obj.Price*obj.Precentage/100;
        end
    end
    methods (Hidden = true)
        function obj = StampDutyCalculator()
           %% 
           DATA = [ 0,       125000,  0; ...
                    125001,  250000,  1; ...
                    250001,  500000,  3; ...
                    500001, 1000000,  4; ...
                   1000000, 2000000,  5; ...
                   2000001,     inf,  7];
               
           %%
           obj.Normal_LUT = dataset({DATA(:,1),'Min'},{DATA(:,2),'Max'},{DATA(:,3),'Percentage'});
           
           %%
           DATA = [ 0,       150000,  0; ...
                    150001,  250000,  1; ...
                    250001,  500000,  3; ...
                    500001, 1000000,  4; ...
                   1000000, 2000000,  5; ...
                   2000001,     inf,  7];
           obj.DisAdv_LUT = dataset({DATA(:,1),'Min'},{DATA(:,2),'Max'},{DATA(:,3),'Percentage'});
        end
    end
end