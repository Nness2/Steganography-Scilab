//** Configuration de l'interface **//
f = figure("figure_name", gettext("Uicontrols demo"),...
"infobar_visible", "off",...
"toolbar_visible", "off",...
"dockable", "off",...
"menubar", "none",...
"default_axes", "off", ...
"Position",[100 100 700 900],...
"resize", "on",...
"BackgroundColor", [0.9 0.9 0.9],...
"Tag", "uicontrols_demo_figure");
uicontrol(f,'style','image','string','point.png','position',[175 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
uicontrol(f,'style','image','string','point.png','position',[175 55 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');


//** Exit application **//
quit_button = uicontrol(f, "Position", [330 15 165 30],...
"Style", "pushbutton",...
"String", gettext("Quitter"),...
"FontSize", 11,...
"Callback", "delete(f)");
appli_menu = uimenu("Parent", f, "Label", gettext("Application"));
close_menu = uimenu("Parent", appli_menu, "Label", gettext("Close figure"), "callback", "delete(f);");
handles.dummy=0;



//** Fonction load image **//
function S1=pbLoad_callback1(handles)
    fn1 = uigetfile("*");//obtenir une fenetre de dialogue 
    S1 = imread(fn1);
    image_base1=uicontrol(f,'style','image','string',fn1,'position',[175 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
endfunction


//** Configuration des boutons **// 
bouton_imgCache = uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.35,0.95,0.30,0.04],'Relief','default','SliderStep',[0.41,0.1],'String','Choisissez une image à cacher','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbLoad','Callback','S1=pbLoad_callback1(handles)');

bouton_retrouver = uicontrol(f,"style","pushbutton","position",[0.35,0.48,0.24,0.04],"Value",[0],"String","Retrouver l image ->","Visible","on","Relief","default","SliderStep",[0.01,0.1],"FontName","Tahoma","FontSize",[12],"FontUnits","points","FontWeight","normal","ForegroundColor",[-1,-1,-1],"HorizontalAlignment","center","ListboxTop",[],"Max",[1],"Min",[0],"unit","normalized","BackgroundColor",[-1,-1,-1],"Enable","on","FontAngle","normal","Callback","trouver_RGB(S1);");



//** Fonctions pour trouver **//
function [as,bs] = trouver(ent)
ent=double(ent);
as=floor(ent/16)*16;
bs=(ent-as)*16;
as=uint8(as);
bs=uint8(bs);
endfunction


function [s1,s2]=trouver_RGB(ent)
s1=ent;
s2=ent;
for i = 1:3
    [s1(:,:,1),s2(:,:,i)]=trouver(ent(:,:,i));
end
imwrite(s2,'image_retrouve.png');
image_mixe=uicontrol(f,'style','image','string','image_retrouve.png','position',[175 55 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
endfunction





