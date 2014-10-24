classdef Contacts < handle
    properties (SetObservable = true)
    	ContactName = 'Clifton Homes';
    	ContactNumber = '0117 2772003';
    	ContactEmail = 'info@premierplot.co.uk';
    end
    properties (Hidden = true,SetObservable = true)
        ContactName_LUT = { 'Clifton Homes'; ...
                            'Cheffins Residential'; ...
                            'Sharman Quinney'; ...
                            'David Clark & Company'; ...
                            'Morris Armitage Sales'; ...
                            'Barford and Co'; ...
                            'Tylers Estate Agents'; ...
                            'Brawshaws'; ...
                            'Tucker Gardner'; ...
                            'Whatley Lane'; ...
                            'Morris Armitage'; ...
                            'THOMAS MORRIS'}; 
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = Contacts;
            ObjectInspector(obj)
        end
        function RUN(obj)
            switch obj.ContactName
                case 'Clifton Homes'
                    obj.ContactNumber = '0117 2772003';
                    obj.ContactEmail = 'info@premierplot.co.uk';                   
                case 'Cheffins Residential'
                    obj.ContactNumber = '01638 663228';
                    obj.ContactEmail = 'newmarket@cheffins.co.uk';   
                case 'Sharman Quinney'
                    obj.ContactNumber = '01954 590016';
                    obj.ContactEmail = 'cambourne@sharmanquinney.co.uk';       
                case 'David Clark & Company'
                    obj.ContactNumber = '01353 665020';
                    obj.ContactEmail = 'mike@clarkhomes.co.uk';        
                case 'Morris Armitage Sales'
                    obj.ContactNumber = '01638 742461';
                    obj.ContactEmail = 'nick@morrisarmitage.co.uk';  
                case 'Barford and Co'
                    obj.ContactNumber = '01480 213811';
                    obj.ContactEmail = 'LizGibson@barfords.co.uk'; 
                case 'Tylers Estate Agents'
                    obj.ContactNumber = '01223 235111';
                    obj.ContactEmail = 'ellis.hale@tylers.net';   
                case 'Tucker Gardner'
                    obj.ContactNumber = '01223 957039';
                    obj.ContactEmail = 'cambridge@tuckergardner.com';     
                case 'Whatley Lane'
                    obj.ContactNumber = '01638 812036';
                    obj.ContactEmail = 'enquiries@whatleylaneestateagents.co.uk'; 
                case 'Morris Armitage'
                    obj.ContactNumber = '01223 462013';
                    obj.ContactEmail = 'cambridge@morrisarmitage.co.uk';    
                case 'THOMAS MORRIS'
                    obj.ContactNumber = '01480 468066';
                    obj.ContactEmail = 'enquiries@tm-stives.co.uk';      
                case 'Brawshaws'
                    obj.ContactNumber = '01223 472011';
                    obj.ContactEmail = 'sales@bradshawsresidential.co.uk';
                otherwise
            end
        end
    end
    methods (Hidden = true)
        function obj = Contacts()
        end
    end
end