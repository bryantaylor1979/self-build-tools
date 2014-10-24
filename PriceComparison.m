%% Saving
RouteD = 290553;
RouteC = 283775;
RouteB = 276998;
RouteA = 270220;

%%
% Build Route A: Building on a largely DIY?basis, substi­tuting 
% around 30% of labour costs with DIY, and employing help with 
% the rest of the building work. Materials pur­chased directly.
%  
% Build Route B: Building using trades­people hired directly. 
% Minimal DIY involvement. Most materials purchased directly.
%  
% Build Route C: Building using a main contractor or package 
% supplier to complete the structure to a weathertight stage, 
% with the remaining work being under­taken by subcontractors 
% most materials purchased by self-builder direct from suppliers.
%  
% Build Route D: Building using a main con­trac­­tor. Building 
% in this way requires the least involvement from the self-builder

Partial_SubCon = RouteD - RouteC
Full_SubCon = RouteC - RouteB
Lobour30 = RouteB - RouteA