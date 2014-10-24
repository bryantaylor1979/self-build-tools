%                     LandDetails.BuildType = '3 bed detached bungalow';
%                     LandDetails.BuildCost_NumberOfStorey = 1;
%                     LandDetails.Garage = '';
%                     LandDetails.BuildCost_HouseFloorArea = 74.4; %m^2 but clear on phone call.
BuildRoute = 'D';
AT_FloorArea = 74.4; % Assumed.
AT_NumberOfStories = 1;

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
Roofing_Material = 'Second-hand slates';

Sloping_Degrees = 0;
Ceiling_Height = 1.7;