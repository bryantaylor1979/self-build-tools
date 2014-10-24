classdef Foundations
    properties
        floorspace = 227; % meters squared (m^2)
        VAT = 20;
        SoilandFoundationsReportCost = 670;
        foundationsType = 'normal';  %What are the different types?
    end
    methods
        function Example(obj)
            %%
            close all
            clear classes
            obj = Foundations
            
            % Vars
            SoilandFoundationsReportCost = obj.SoilandFoundationsReportCost*(100 + obj.VAT)/100;
            disp(['soil and engineer’s report: £',num2str(SoilandFoundationsReportCost)]);
            %%
            costs.Preliminaries.total = 1631.76;
            costs.SiteSetout.total  = 516.24;
            costs.SiteStrip.total  = 2324.16
            costs.Excavations.total  = 3284.16
            costs.ConcreteFoundations.total  = 3934.82
            costs.FoundationWalls2dpc.total  = 2397.65
            
            %%
            NumberOfWeeks = 20;
            ContainerCostPerWeek = 40;
            ToiletCostPerWeek = 27.99;
            costs.Preliminaries = obj.Preliminaries(NumberOfWeeks,ContainerCostPerWeek,ToiletCostPerWeek);

            %%
            sub_cat_print = true;
            obj.Print(costs,sub_cat_print)
        end
        function Print(obj,costs,sub_cat_print)
            NAMES = fieldnames(costs);
            x = size(NAMES,1);
            FoundationTotal = 0;
            for i = 1:x
                NAMES2 = fieldnames(costs.(NAMES{i}).sub);
                y = max(size(NAMES2));
                for j = 1:y
                    name = NAMES2{j};
                    var = costs.(NAMES{i}).sub.(name);
                    if sub_cat_print == true
                        disp(['    ',name,':   ',num2str(var)]);
                    end
                end
                FoundationTotal = FoundationTotal + costs.(NAMES{i}).total;
                fprintf('%s Total: £%4.2f\n',NAMES{i},costs.(NAMES{i}).total);
            end
            fprintf('\nFoundation Total: £%4.2f\n\n\n',FoundationTotal);            
        end
        function costs = Preliminaries(obj,NumberOfWeeks,ContainerCostPerWeek,ToiletCostPerWeek)
            %% Preliminaries
            % A site hut or container will already have been on site, positioned so as 
            % not to interfere with the work. The costs prior to commencement of work 
            % have already been accounted for but now the remaining time of hire will 
            % be costed in.
            % Toilet facilities are not mandatory but they are certainly advisable 
            % and the toilet should be sited to be clear of the works, yet accessible 
            % for cleaning and emptying.
            costs.sub.container = ContainerCostPerWeek*NumberOfWeeks*(100+obj.VAT)/100;
            costs.sub.toilet = ToiletCostPerWeek*NumberOfWeeks*(100+obj.VAT)/100;
            costs.total = obj.SubTotal_Calc(costs.sub);
        end
        function total = SubTotal_Calc(obj,struct)
            total = 0;
            names = fieldnames(struct);
            for i = 1:max(size(names))
                total = total + struct.(names{i});
            end
        end
    end
end
%% soil investigation and engineer’s report
% Before costing up for the foundations, it is important to set aside 
% £670 + VAT for a soil investigation and engineer’s report. This is essential
% for any successful project because it helps to determine the type of 
% foundations that will be required. Most sites will be fine with ‘normal’ foundations. 




%% Foundation cost
% Vars








%% Site set-out
% The groundworkers may do this but it is often advisable to get a 
% professional in to make sure that the house is sited correctly. The house 
% should be set out on the ground and then set back to profile, approximately 
% 5m from the building so that they are not interfered with during the dig.


%% Site Strip
% All vegetable soil has to be removed from the oversite of the house and 
% it’s usual to extend this for at least 1m beyond the walls to allow for 
% eventual pathways etc. Thought needs to be given as to where to store it 
% without interfering with subsequent works. Topsoil will bulk up by around 
% 20% and then shrink back down in the heap, so don’t be too frightened of 
% storing more as it’s expensive to buy back at a later date. Nevertheless, 
% some will probably have to go. Strip topsoil 200mm deep over 163m², lay 
% aside 50% and send the rest away.


%% Excavations
% All cavity walls should have a trench width of 600mm and a depth of 1,200mm. 
% Single-skin partition and load-bearing walls can sometimes be reduced to a 
% width of 450mm but the business of changing buckets on a busy site often 
% means that this is foregone. Spoil will almost certainly have to be removed 
% in its entirety but if there is sufficient space on site to store it and 
% levels are going to be made up, savings on ‘muck away’ can be made. 
% Excavate 45m³ spoil.


%% Concrete foundations
%More and more sites now utilise a trenchfill foundation where the concrete
%is poured to within 200mm of the top of the trench with just one or two 
%courses of blockwork to DPC. This method gets you out of the ground in one 
%day and away from dependence on the weather or hostage to shifting trench 
%sides. The use of a pump, whilst expensive, means that the concrete can 
%also be placed in one day, cutting down on time and labour. It is assumed 
%that the ground workers have their own laser level to determine concrete 
%height in relation to blockwork and DPC level.


%% Foundation walls to dpc
%Foundation walls below DPC are usually constructed with two skins of solid
%concrete blockwork with the cavity filled with concrete to 150mm below DPC.
%Unless you choose to mix this cavity fill by hand on site, a delivery of a
%part load of ready-mixed concrete will attract a higher price. The cement 
%mixer will have to be hired at this point and will stay for the duration 
%of the job, so it is costed in at this point for a 20-week duration.
%
%The blockwork on the external skin stops at just below ground level so 
%that bricks are shown between ground and DPC. The few bricks that are 
%required will be taken off the stack of bricks for the main superstructure #
%in order to take advantage of full load prices. These below DPC bricks are 
%often left until after oversite to avoid them being damaged but are costed 
%in at this point. Twin-skin solid internal walls require wider blocks in 
%the foundation.

