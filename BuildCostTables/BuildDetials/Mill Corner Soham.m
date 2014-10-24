%                     LandDetails.BuildType = '3_bed_house';
%                     LandDetails.BuildCost_NumberOfStorey = 2;
%                     LandDetails.Garage = 'unknown';
%                     %The GEA of the ground floor has been calculated at 70m2 (approximately)
%                     % 70 + ?
%                     LandDetails.BuildCost_HouseFloorArea = 125;
BuildRoute = 'D';
AT_FloorArea = 125;
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