%                     LandDetails.BuildType = '2_bed_house';
%                     LandDetails.BuildCost_NumberOfStorey = 1;
%                     LandDetails.Garage = 'unknown';
%                     %Plot Two: approximately 702 sq ft
%                     LandDetails.BuildCost_HouseFloorArea = 65.2174; %m^2
BuildRoute = 'D';
AT_FloorArea = 65;
AT_NumberOfStories = 2;

%Standard
%Good
%Excellent
AT_ExpectedLevelOfSpecification = 'Standard'; 

%Normal
%facing_bricks_standard
%facing_bricks_good
%brick
%render_on_blockwork
%timber_cladding
%handmade_weather_tiling
%rubble walling/flint
%reconstituted_stone
%natural_stone
Facing_Material = 'Normal';

%Normal
%concrete interlocking tiles
%clay machine-made tiles
%plain clay tiles
%Welsh slate 
%Second-hand slates
%handmade clay tiles
%reed thatch
Roofing_Material = 'Normal';

Sloping_Degrees = 0;
Ceiling_Height = 2.4;