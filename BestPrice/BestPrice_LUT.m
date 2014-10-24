classdef BestPrice_LUT <  handle
    properties (SetObservable = true)
       PropertyName = 'Hilton_Street__Over';
       NumberOfBedrooms = 4;
       Type = 'bungalow';
       EnSuite = true;
       Garage = false;
       Price = 280000;
       DateOfSale = '21-June-2012';
       PropertyArea = NaN; % 
       LandSize = NaN; % meter sq
       NewBuild = false;
    end
    properties (Hidden = true, SetObservable = true)
        % first is the default target. 
       PropertyName_LUT = { 'Mustils_Lane'; ...
                            'Hilton_Street__Over'; ...
                            'Cromwell_Park__Over'; ...
                            'High_Piece_Crescent__Over'; ...
                            'Bonheur_Willingham'; ...
                            'Stable_Cottage__Over'; ...
                            'RamptonRoad_Willingham'};
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = BestPrice_LUT()
            ObjectInspector(obj)
        end
        function RUN(obj)
            obj.Property_LUT(obj.PropertyName)
        end
    end
    methods (Hidden = true)
        function obj = BestPrice_LUT()
        end
        function Property_LUT(obj,PropertyName)
           switch PropertyName
               case 'Mustils_Lane'  %
                   obj.NumberOfBedrooms = 3;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = false;
                   obj.Price = 275000;
                   obj.DateOfSale = 'N/A';
                   obj.PropertyArea = 74.4; % 
                   obj.LandSize = NaN; % meter sq
                   obj.NewBuild = true;
                   
               case 'Hilton_Street__Over'
                   obj.NumberOfBedrooms = 4;
                   obj.Type = 'bungalow';
                   obj.EnSuite = true;
                   obj.Garage = false;
                   obj.Price = 280000;
                   obj.DateOfSale = '21-Jun-2012';
                   obj.PropertyArea = NaN; % 
                   obj.LandSize = NaN; % meter sq
                   obj.NewBuild = false;
                   
               case 'Cromwell_Park__Over'
                   obj.NumberOfBedrooms = 3;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = true;
                   obj.Price = 277000;
                   obj.DateOfSale = '29-Sep-2013';
                   obj.PropertyArea = NaN; % 
                   obj.LandSize = NaN; % meter sq
                   obj.NewBuild = false;
                   
               case 'High_Piece_Crescent__Over'
                   obj.NumberOfBedrooms = 3;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = true;
                   obj.Price = 265000;
                   obj.DateOfSale = '29-May-2013';
                   obj.PropertyArea = NaN; % 
                   obj.LandSize = NaN; % meter sq  
                   obj.NewBuild = false;
                  
               case 'Bonheur_Willingham'
                   obj.NumberOfBedrooms = 2;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = true;
                   obj.Price = 250000;
                   obj.DateOfSale = '18-Feb-2013';
                   obj.PropertyArea = 70;
                   obj.LandSize = NaN;
                   obj.NewBuild = false; 
                   
               case 'Stable_Cottage__Over'
                   obj.NumberOfBedrooms = 3;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = false;
                   obj.Price = 250000;
                   obj.DateOfSale = '30-Sep-2010';
                   obj.PropertyArea = 83.6;
                   obj.LandSize = NaN;
                   obj.NewBuild = false; 
                   
               case 'RamptonRoad_Willingham'
                   obj.NumberOfBedrooms = 3;
                   obj.Type = 'bungalow';
                   obj.EnSuite = false;
                   obj.Garage = true;
                   obj.Price = 275000;
                   obj.DateOfSale = '30-Apr-2012';
                   obj.PropertyArea = 102;
                   obj.LandSize = NaN;
                   obj.NewBuild = true;
               otherwise
                   error('property not found')
           end
        end
    end
end