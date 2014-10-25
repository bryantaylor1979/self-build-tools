classdef BuildCosts_withAdj < handle
    properties (SetObservable = true)
        INPUTS
        RootPath = 'C:\sourcecode\selfBuild\'
        Name = 'The Willows - Highfields Caldecote';
        BuildRoute = 'D';
        AT_FloorArea = 120;
        AT_NumberOfStories = 2;
        AT_ExpectedLevelOfSpecification = 'Standard';
        Facing_Material = 'Normal';
        Roofing_Material = 'Normal';
        Sloping_Degrees = 0;
        Ceiling_Height = 2.4;
        
        STATUS
        Facing_Total_Cost
        Roofing_Total_Cost
        
        OUTPUTS
        AT_BuildCost
        Facing_Additional_Cost
        Roofing_Additional_Cost
        Sloping_Additional_Cost
        CeilingHeight_Additional_Cost
        Total_BuildCost
   
%         %Bespoke Joinery or Kitchen
%         JoineryKitchen_Budget_CostPerSqMeter = 40;
%         JoineryKitchen_Budget
%         
%         RoofSpace = 60;
%         RoofSpace_Factor = 0.7;
%         UsingRoofSpace = 'no';
          
        
        
        OBJECTS
        AT_OBJ
        Facing_OBJ
        Roofing_OBJ
        Sloping_OBJ
        CeilingHeight_OBJ
    end
    properties (Hidden = true, SetObservable = true)
        Facing_Material_LUT = { 'Normal'; ...
                                'facing_bricks_standard'; ...
                                'facing_bricks_good'; ...
                                'brick'; ...
                                'render_on_blockwork'; ...
                                'timber_cladding'; ...
                                'handmade_weather_tiling'; ...
                                'rubble walling/flint'; ...
                                'reconstituted_stone'; ...
                                'natural_stone'};
                            
        Roofing_Material_LUT = {'Normal'; ...
                                'concrete interlocking tiles'; ...
                                'clay machine-made tiles'; ...
                                'plain clay tiles'; ...
                                'Welsh slate'; ...  
                                'Second-hand slates'; ...
                                'handmade clay tiles'; ...
                                'reed thatch'};
                            
        UsingRoofSpace_LUT = {  'yes'; ...
                                'no'};
        SlopingSite_LUT = { 'yes'; ...
                            'no'};
        AT_ExpectedLevelOfSpecification_LUT = { 'Standard'; ...
                                                'Good'; ...
                                                'Excellent'};
        Name_LUT = {    'Isaacson Road - Burwell'; ...
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
                        'Mustills Lane - Longstanton Rd - Over - Cambs'};
    end
    methods
        function Example(obj)
           %%
           close all
           clear classes
           obj = BuildCosts_withAdj('RootPath','C:\git\self-build-tools\');
           obj
           obj.RUN
           obj
           
           %%
           ObjectInspector(obj);           
        end
        function RUN(obj)
           %
           obj.LoadBuildDetails(obj.Name);
            
           % Average Tables
           obj.AT_OBJ.BuildRoute = obj.BuildRoute;
           obj.AT_OBJ.FloorArea = obj.AT_FloorArea;
           obj.AT_OBJ.NumberOfStories = obj.AT_NumberOfStories;
           obj.AT_OBJ.ExpectedLevelOfSpecification = obj.AT_ExpectedLevelOfSpecification;
           if not(isnan(obj.AT_OBJ.FloorArea))
                obj.AT_OBJ.RUN();
                obj.AT_BuildCost = obj.AT_OBJ.BuildCost;
           else
                obj.AT_BuildCost = NaN;
           end
           
           % Facing
           if isnan(obj.AT_OBJ.FloorArea)
               obj.Facing_Additional_Cost = 0;
           else
           obj.Facing_OBJ.ExpectedLevelOfSpecification = obj.AT_ExpectedLevelOfSpecification;
           obj.Facing_OBJ.FloorArea = obj.AT_FloorArea;
           obj.Facing_OBJ.MaterialType = obj.Facing_Material;
           obj.Facing_OBJ.RUN();
           obj.Facing_Additional_Cost = obj.Facing_OBJ.Additional_Cost;
           obj.Facing_Total_Cost = obj.Facing_OBJ.Total_Cost;
           end
           
           % Roofing
           if isnan(obj.AT_OBJ.FloorArea)
           obj.Roofing_Total_Cost = 0;    
           else
           obj.Roofing_OBJ.ExpectedLevelOfSpecification = obj.AT_ExpectedLevelOfSpecification;
           obj.Roofing_OBJ.FloorArea = obj.AT_FloorArea;
           obj.Roofing_OBJ.MaterialType = obj.Roofing_Material;
           obj.Roofing_OBJ.RUN();
           obj.Roofing_Additional_Cost = obj.Roofing_OBJ.Additional_Cost;
           obj.Roofing_Total_Cost = obj.Roofing_OBJ.Total_Cost;
           end
           
           % Sloping
           if isnan(obj.AT_OBJ.FloorArea)
           obj.Sloping_Additional_Cost = 0;
           else
           obj.Sloping_OBJ.SlopingSite = 'yes';
           obj.Sloping_OBJ.FloorArea = obj.AT_FloorArea;
           obj.Sloping_OBJ.Degrees = obj.Sloping_Degrees;
           obj.Sloping_OBJ.RUN();
           obj.Sloping_Additional_Cost = obj.Sloping_OBJ.Additional_Cost;
           end
           
           
           % Ceiling Height
           if isnan(obj.AT_OBJ.FloorArea)
           obj.CeilingHeight_Additional_Cost = 0;    
           else
           obj.Ceiling_Height = obj.CeilingHeight_OBJ.Ceiling_Height;
           obj.CeilingHeight_OBJ.RUN();
           obj.CeilingHeight_Additional_Cost = obj.CeilingHeight_OBJ.Additional_Cost;
           end
           
           % Total Build Cost
           obj.Total_BuildCost =    obj.AT_BuildCost + ...
                                    obj.Facing_Additional_Cost + ...
                                    obj.Roofing_Additional_Cost + ...
                                    obj.Sloping_Additional_Cost + ...
                                    obj.CeilingHeight_Additional_Cost;     
                                
%            if strcmpi(obj.UsingRoofSpace,'yes')
%                RoofCost = obj.AT_OBJ.CostPerSqMeter*obj.RoofSpace*0.7;
%                obj.BuildCost = RoofCost + obj.BuildCost;
%            end  
%            
%            
%            
%            % kitchen
%            obj.JoineryKitchen_Budget = obj.JoineryKitchen_Budget_CostPerSqMeter*obj.FloorArea;  
%            
        end
    end
    methods (Hidden = true)
        function LoadBuildDetails(obj,Name)
           text = obj.ReadFileByLine([obj.RootPath,'BuildCostTables\BuildDetials\',Name,'.m'])
           x = size(text,1)
           for i = 1:x
              string = text{i};
              try
              if not(strcmpi(string(1),'%'))
                eval(['obj.',string])
              end
              end
           end            
        end
        function text = ReadFileByLine(obj,Name)
            try
                text = textread(Name,'%s','delimiter','\n','whitespace','');
            catch
                disp(['File not found: ',Name])
            end           
        end
        function obj = BuildCosts_withAdj(varargin)
           x = size(varargin,2);
           for i = 1:2:x
               obj.(varargin{i}) = varargin{i+1};
           end
           obj.AT_OBJ = BuildCosts('RootPath',obj.RootPath);
           obj.Facing_OBJ = FacingMaterial_Adj;
           obj.Roofing_OBJ = RoofingMaterial_Adj;
           obj.Sloping_OBJ = SlopingSite_Adj;
           obj.CeilingHeight_OBJ = CeilingHeight_Adj;
        end
    end
end