function LandDetails = PropertiesDetails(PropertyName)
    switch PropertyName
        case 'At 24 Hereward Close'
            %%
            LandDetails.Name = 'At 24 Hereward Close';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';
            LandDetails.PlotArea = NaN; %m^2 estimate 6.53*6.53*4.5 = 192
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 200000; % 
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 4.0;
            LandDetails.SalePrice = 325000; 

            LandDetails.PlanningPermissionDoc = ' ';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Clifton Homes';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-28116429.html?utm_content=ealertspropertylink&utm_medium=email&utm_source=emailupdates&utm_campaign=emailupdatesjun11&utm_term=buying&sc_id=10465785&onetime_FromEmail=true';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = '';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'unknown';
            LandDetails.Services_Electricity = 'unknown';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;

            %% ESTAMATE ASSUMED:  Additional cost
            %Clearing the land �2000
            %Public open space contribution �3104.38
            %Community Space Contribution: �513.04
            %Household Waste Receptabcle Contribution �69.50
            %Monitoring Contribution �50.00
            LandDetails.AddtionalRequiredCosts = 4000 + 3104.38 + 513.04 + 69.50 + 50.00;

        case 'Rampton, Cambridge'
            %%
            LandDetails.Name = 'Rampton, Cambridge';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';
            LandDetails.PlotArea = NaN; %m^2 estimate 6.53*6.53*4.5 = 192
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 165535; % 
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 4.0;
            LandDetails.SalePrice = 450000; 

            LandDetails.PlanningPermissionDoc = 'S/1366/11*';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Clifton Homes';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-28116429.html?utm_content=ealertspropertylink&utm_medium=email&utm_source=emailupdates&utm_campaign=emailupdatesjun11&utm_term=buying&sc_id=10465785&onetime_FromEmail=true';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = '';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'unknown';
            LandDetails.Services_Electricity = 'unknown';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;

            %% ESTAMATE ASSUMED:  Additional cost
            %Clearing the land �2000
            %Public open space contribution �3104.38
            %Community Space Contribution: �513.04
            %Household Waste Receptabcle Contribution �69.50
            %Monitoring Contribution �50.00
            LandDetails.AddtionalRequiredCosts = 4000 + 3104.38 + 513.04 + 69.50 + 50.00;

         case 'Long Lane - Willingham - Cambridge'
            %%
            LandDetails.Name = 'Long Lane - Willingham - Cambridge';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';
            LandDetails.PlotArea = 192; %m^2 estimate 6.53*6.53*4.5 = 192
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 115000; % 
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 5.0;
            LandDetails.SalePrice = 230000; 

            LandDetails.PlanningPermissionDoc = 'S/1607/12/FL';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Tylers Estate Agents';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-40137937.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'CB24 5LB';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'unknown';
            LandDetails.Services_Electricity = 'unknown';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = true;
            LandDetails.AddtionalRequiredCosts = 0;

            %% Additional cose
            %Clearing the land �2000
            %Public open space contribution �3104.38
            %Community Space Contribution: �513.04
            %Household Waste Receptabcle Contribution �69.50
            %Monitoring Contribution �50.00
            LandDetails.AddtionalRequiredCosts = 4000 + 3104.38 + 513.04 + 69.50 + 50.00;

          case 'Isaacson Road - Burwell'
            %%
            LandDetails.Name = 'Isaacson Road - Burwell';
            LandDetails.Available = 'no';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';
            LandDetails.PlotArea = 2023; %m^2 0.5 acres
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 495000; % 
            LandDetails.NoOfProperty = 2;
            LandDetails.Distance = 8.36;
            LandDetails.SalePrice = 525000*2; %Resale maybe around �500-550k

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Clifton Homes';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-38408320.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'CB25 0AF';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

         case 'Land for sale - Building Plot at New Road'
            %%
            LandDetails.Name = 'Land for sale - Building Plot at New Road';
            LandDetails.Available = 'no';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';
            LandDetails.PlotArea = NaN; %m^2

            % DIMENSIONS: Frontage - approximately 28 metres.
            % Overall Depth - Approximately 42 metres.
            % Rear Width - Approximately 6.8 metres.
            LandDetails.Dimensions_Meters = [28,mean([42,6.8])]; %m
            LandDetails.Price = 65000; % reduce from 95000
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 13;
            %Approximately between �210,000 and �230,000. 
            %A factor which should be taken into account is that 
            %the plot is situated underneath the Haddenham water tower. 
            LandDetails.SalePrice = 220000; % 210000 -> 230000

            LandDetails.PlanningPermissionDoc = '';
            %We believe that the plot is being sold Freehold
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Cheffins Residential';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-26174589.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = '';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes'; %"believed
            LandDetails.Services_Electricity = 'yes'; %"believed
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Great Cambourne'
            %%
            LandDetails.Name = 'Great Cambourne';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';                    
            LandDetails.PlotArea = 240; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 146000;
            LandDetails.NoOfProperty = 2;
            LandDetails.Distance = 8.1;
            LandDetails.SalePrice = 360000;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = 'freehold'; %As far as I know the land is freehold
            LandDetails.ContactName = 'Sharman Quinney';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-36581272.html?premiumA=true';
            LandDetails.PlanningPermission = 'no'; %But not expected to be a problem. 
            LandDetails.Postcode = 'CB23';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Mill Corner Soham'
            %%
            LandDetails.Name = 'Mill Corner Soham';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  

            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';   

            %209.89m2 (approximately)
            LandDetails.PlotArea = 210; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 70000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 20;
            %Dependant on the market, quality of finish and landscaping etc � 
            %informal enquiry of our residential teams leads me believe that
            %a sale price would be up to �175.000
            LandDetails.SalePrice = 175000; %


            %East Cambridgeshire District Councils website 
            LandDetails.PlanningPermissionDoc = '12/00307/FUL';
            LandDetails.PlotLegalType = 'freehold with vacant possession';
            LandDetails.ContactName = 'Cheffins Residential';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-37847728.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.GoogleMap = '';
            LandDetails.Postcode = 'CB7 5HT';
            %The plot is in close proximity to other dwellings, so 
            %it would be anticipated that all mains services would 
            %be available. I would advise prospective purchasers to 
            %make there own enquiries about availability and 
            %connection charges. 
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'posssibly clay';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Mereside - Soham - Plot1'
            %%
            LandDetails.Name = 'Mereside - Soham - Plot1';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';                    
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [12, 26.5]; %m
            LandDetails.Price = 105000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 21;
            LandDetails.SalePrice = 240000; % From e-mail

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'David Clark & Company';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-41600162.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB7 5EG';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'posssibly clay';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Mereside - Soham - Plot2'
            %%
            LandDetails.Name = 'Mereside - Soham - Plot2';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';                    
            LandDetails.PlotArea = 2; %m^2
            LandDetails.Dimensions_Meters = [12, 23]; %m
            LandDetails.Price = 105000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 21;
            LandDetails.SalePrice = 240000; % My estimation

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'David Clark & Company';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-41600162.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB7 5EG';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'posssibly clay';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;


        case 'Isleham - Robin Close'
            %%
            LandDetails.Name = 'Isleham - Robin Close';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';  
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';  
            % struggling to understand the size of plot from the
            % land
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 100000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 21;
            % Ball park figure of �250,000 - �275,000 
            LandDetails.SalePrice = 275000;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = 'Freehold';
            LandDetails.ContactName = 'Morris Armitage Sales';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-36694108.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'CB7';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Gibraltar Lane'
            %% E-mail sent to plotshare and estate agency  
            LandDetails.Name = 'Gibraltar Lane';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';                      
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';                   
            LandDetails.PlotArea = 1901; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 285000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 10;
            LandDetails.SalePrice = 400000 + 300000 + 200000; %my own estimation

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Barford and Co';
            LandDetails.WebLink = 'http://www.buildstore.co.uk/findingland/plotdetail.aspx?pid=114209';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.GoogleMap = '';
            LandDetails.Postcode = 'CB24 4RR';
            LandDetails.WebSite = 'PlotSearch';
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = true;
            LandDetails.AddtionalRequiredCosts = 65566 + 40000;
            LandDetials.archaeological_investigation = true;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Lambs Lane - Cottenham'
            %% SOLD 12/06/2013
            LandDetails.Name = 'Lambs Lane - Cottenham';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '29th May';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';                     
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [21.2,10.60]; %m
            LandDetails.Price = 95000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 5.5;
            LandDetails.SalePrice = 210000; %from phone call please ensure this is the correct house

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlanningPermissionDoc = 'S/0148/13*';

            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Tylers Estate Agents';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-25915041.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'CB24 8TA';
            LandDetails.GoogleMap = 'https://maps.google.co.uk/maps?q=Lambs+Lane,+Cottenham&hl=en&ll=52.288231,0.130591&spn=0.010225,0.028045&sll=52.308872,0.016201&sspn=0.009577,0.009742&hnear=Lamb''s+Ln,+Cottenham,+Cambridge+CB24+8TB,+United+Kingdom&t=m&z=16';
            LandDetails.WebSite = 'RightMove';
            % all service will be run from existing house
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Haslingfield'
            %%
            LandDetails.Name = 'Haslingfield';
            LandDetails.Available = 'NO';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';                     
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [14.5,17.5]; %m
            LandDetails.Price = 125000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 9.5;
            LandDetails.SalePrice = NaN;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Cheffins Residential';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-40624934.html';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = '';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'not investigated';
            LandDetails.Services_Water = 'not investigated';
            LandDetails.Services_Electricity = 'not investigated';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'The Willows - Highfields Caldecote'
            %%
            LandDetails.Name = 'The Willows - Highfields Caldecote';
            LandDetails.Available = 'no';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';                     
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 155000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 7.7;
            LandDetails.SalePrice = 400000;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Tucker Gardner';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-26456631.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB23 7PB';
            LandDetails.GoogleMap = 'https://maps.google.co.uk/maps?q=CB23+7PB&hnear=Highfields+Caldecote+CB23+7PB,+United+Kingdom&t=m&z=16';
            LandDetails.WebSite = 'RightMove'; 
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'not investigated';
            LandDetails.Services_Water = 'not investigated';
            LandDetails.Services_Electricity = 'not investigated';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Mill Lane - Exning - Plot1'
            %%
            LandDetails.Name = 'Mill Lane - Exning - Plot1'; 
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';                     
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 80000;
            LandDetails.NoOfProperty = 2;
            LandDetails.Distance = 16;
            LandDetails.SalePrice = NaN;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Whatley Lane';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-39901412.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB8';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove'; 
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'not investigated';
            LandDetails.Services_Water = 'not investigated';
            LandDetails.Services_Electricity = 'not investigated';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Mill Lane - Exning - Plot2'
            %%
            LandDetails.Name = 'Mill Lane - Exning - Plot2';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';                       
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 80000;
            LandDetails.NoOfProperty = 2;
            LandDetails.Distance = 16;
            LandDetails.SalePrice = NaN;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Whatley Lane';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-39901412.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB8';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove'; 
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'not investigated';
            LandDetails.Services_Water = 'not investigated';
            LandDetails.Services_Electricity = 'not investigated';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Land for sale - Exning'
            %%
            LandDetails.Name = 'Land for sale - Exning';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';                       
            LandDetails.PlotArea = 800; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 180000;
            LandDetails.NoOfProperty = 2;
            LandDetails.Distance = 16;
            LandDetails.SalePrice = NaN;

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Morris Armitage';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-39901412.html';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB8';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove'; 
            LandDetails.Services_MainGas = 'not investigated';
            LandDetails.Services_Drainage = 'not investigated';
            LandDetails.Services_Water = 'not investigated';
            LandDetails.Services_Electricity = 'not investigated';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;

       case 'Meadow Lane - Earith'
            %%
            LandDetails.Name = 'Meadow Lane - Earith';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';   
            LandDetails.PlotArea = 562; %m^2
            % 100� x 55�
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 179500;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 18;
            LandDetails.SalePrice = 500000;
            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'THOMAS MORRIS';
            LandDetails.WebLink = 'http://www.rightmove.co.uk/property-for-sale/property-26199015.html?premiumA=true';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'PE28';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            %* No services currently on plot.  
            % Purchasers responsibility to connect all relevant services.  
            % Mains gas/water/drainage and electricity all available in the village.
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;
            LandDetails.AddtionalRequiredCosts = 0;
            
        case 'Mustills Lane - New'
            %%
            LandDetails.Name = 'Mustills Lane - Longstanton Rd - Over - Cambs';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';   
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [24.5,20]; %m
            LandDetails.Price = 126000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 5.5;
            LandDetails.SalePrice = 400000; %From Phone Call: High 200 approaching 300. (From Phone call)

            LandDetails.PlanningPermissionDoc = 'S/1771/12/FL';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Tylers Estate Agents';
            LandDetails.WebLink = '';
            LandDetails.PlanningPermission = 'granted';
            LandDetails.Postcode = 'CB24 5PW';
            LandDetails.GoogleMap = 'https://maps.google.co.uk/maps?q=Mustill''s+Ln,+Over,+Cambridgeshire+CB24,+United+Kingdom&hl=en&ll=52.309069,0.026135&spn=0.0098,0.028045&geocode=FS4mHgMdpkIAAA&hnear=Mustill''s+Ln,+Over,+Cambridgeshire+CB24,+United+Kingdom&t=m&z=16';
            LandDetails.WebSite = 'RightMove';
            % From phone call -> All service are believed to be
            % available from the road next to the site. 
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;

            %% Additional cose
            %Clearing the land �2000
            %Public open space contribution �3104.38
            %Community Space Contribution: �513.04
            %Household Waste Receptabcle Contribution �69.50
            %Monitoring Contribution �50.00
            LandDetails.AddtionalRequiredCosts = 2000 + 3104.38 + 513.04 + 69.50 + 50.00;
        case 'Mustills Lane - Longstanton Rd - Over - Cambs'
            %%
            LandDetails.Name = 'Mustills Lane - Longstanton Rd - Over - Cambs';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'yes';   
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [24.5,20]; %m
            LandDetails.Price = 126000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 5.5;
            LandDetails.SalePrice = 250000; %From Phone Call: High 200 approaching 300. (From Phone call)

            LandDetails.PlanningPermissionDoc = 'S/1771/12/FL';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Tylers Estate Agents';
            LandDetails.WebLink = '';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB24 5PW';
            LandDetails.GoogleMap = 'https://maps.google.co.uk/maps?q=Mustill''s+Ln,+Over,+Cambridgeshire+CB24,+United+Kingdom&hl=en&ll=52.309069,0.026135&spn=0.0098,0.028045&geocode=FS4mHgMdpkIAAA&hnear=Mustill''s+Ln,+Over,+Cambridgeshire+CB24,+United+Kingdom&t=m&z=16';
            LandDetails.WebSite = 'RightMove';
            % From phone call -> All service are believed to be
            % available from the road next to the site. 
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;

            %% Additional cose
            %Clearing the land �2000
            %Public open space contribution �3104.38
            %Community Space Contribution: �513.04
            %Household Waste Receptabcle Contribution �69.50
            %Monitoring Contribution �50.00
            LandDetails.AddtionalRequiredCosts = 2000 + 3104.38 + 513.04 + 69.50 + 50.00;

        case 'Building Plot Rear Of - 143 High Street - Cottenham'
            LandDetails.Name = 'Building Plot Rear Of - 143 High Street - Cottenham';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'no';
            LandDetails.EmailedReply = 'no';   
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 100000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = 5.5;
            %We expect the finished property to be worth between �175,000 and �195,000.
            LandDetails.SalePrice = 185000; 

            LandDetails.PlanningPermissionDoc = 'S/2205/12/OL';
            LandDetails.PlotLegalType = 'freehold';
            LandDetails.ContactName = 'Tylers Estate Agents';
            LandDetails.WebLink = '';
            LandDetails.PlanningPermission = 'yes';
            LandDetails.Postcode = 'N/A';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            % From phone call -> All service are believed to be
            % available from the road next to the site. 
            LandDetails.Services_MainGas = 'yes';
            LandDetails.Services_Drainage = 'yes';
            LandDetails.Services_Water = 'yes';
            LandDetails.Services_Electricity = 'yes';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;  
            LandDetails.AddtionalRequiredCosts = 0;

        case 'Land for sale in Cambridgeshire. High Street'
            LandDetails.Name = 'Land for sale in Cambridgeshire. High Street';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';   
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 150000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = NaN;
            %We expect the finished property to be worth between �175,000 and �195,000.
            LandDetails.SalePrice = 3; %GUESS, but close enough

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Brawshaws';
            LandDetails.WebLink = '';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB24 6AJ';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            % From phone call -> All service are believed to be
            % available from the road next to the site. 
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'unknown';
            LandDetails.Services_Electricity = 'unknown';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;    
            LandDetails.AddtionalRequiredCosts = 0;

       case 'Bourn Road, Caxton, Cambridge'
           % 180 m2
            LandDetails.Name = 'Bourn Road, Caxton, Cambridge';
            LandDetails.Available = 'yes';
            LandDetails.DateAvailablityLastChecked = '';
            LandDetails.Emailed = 'yes';
            LandDetails.EmailedReply = 'no';   
            LandDetails.PlotArea = NaN; %m^2
            LandDetails.Dimensions_Meters = [NaN,NaN]; %m
            LandDetails.Price = 200000;
            LandDetails.NoOfProperty = 1;
            LandDetails.Distance = NaN;
            %We expect the finished property to be worth between �175,000 and �195,000.
            LandDetails.SalePrice = 3; %GUESS, but close enough

            LandDetails.PlanningPermissionDoc = '';
            LandDetails.PlotLegalType = '';
            LandDetails.ContactName = 'Brawshaws';
            LandDetails.WebLink = '';
            LandDetails.PlanningPermission = 'unknown';
            LandDetails.Postcode = 'CB24 6AJ';
            LandDetails.GoogleMap = '';
            LandDetails.WebSite = 'RightMove';
            % From phone call -> All service are believed to be
            % available from the road next to the site. 
            LandDetails.Services_MainGas = 'unknown';
            LandDetails.Services_Drainage = 'unknown';
            LandDetails.Services_Water = 'unknown';
            LandDetails.Services_Electricity = 'unknown';
            LandDetails.FoundationType = 'unknown';
            LandDetails.DemolishingRequired = false;    
            LandDetails.AddtionalRequiredCosts = 0;
        otherwise
            error(['property not found: ',PropertyName])
    end
 end
function example()
    %%
    close all
    clear classes
    LandDetails = PropertiesDetails('At 24 Hereward Close')
end