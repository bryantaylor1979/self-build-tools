%                     % 2 Bed Bungalow            - 645 sq ft     -> 60 m2
%                     % 4 Bed Detached Dwelling   - 1765 sq ft    -> 164 m2
%                     % 4/5 Detached Dwelling     - 2390 sq ft    -> 222 m2
%                     LandDetails.BuildType = '4/5 Bedrooom plot';
%                     LandDetails.BuildCost_NumberOfStorey = 2;
%                     LandDetails.Garage = 'unknown';
%                     LandDetails.BuildCost_HouseFloorArea = 446;
BuildRoute = 'D';
AT_FloorArea = 446;
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