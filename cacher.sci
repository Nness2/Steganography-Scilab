//** Configuration de l'interface **//
f = figure("figure_name", gettext("Uicontrols demo"),...
"infobar_visible", "off",...
"toolbar_visible", "off",...
"dockable", "off",...
"menubar", "none",...
"default_axes", "off", ...
"Position",[100 100 900 900],...
"resize", "on",...
"BackgroundColor", [0.9 0.9 0.9],...
"Tag", "uicontrols_demo_figure");
uicontrol(f,'style','image','string','point.png','position',[60 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
uicontrol(f,'style','image','string','point.png','position',[480 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
uicontrol(f,'style','image','string','point.png','position',[480 55 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
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
    image_base1=uicontrol(f,'style','image','string',fn1,'position',[60 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
endfunction

function S2=pbLoad_callback2(handles)
    fn2 = uigetfile('*'); 
    S2 = imread(fn2);
    image_base2=uicontrol(f,'style','image','string',fn2,'position',[480 470 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
endfunction


//** Configuration des boutons **// 
bouton_quiChache = uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.15,0.95,0.25,0.04],'Relief','default','SliderStep',[0.41,0.1],'String','Choisissez une image à cacher','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbLoad','Callback','S1=pbLoad_callback1(handles)');

bouton_Acacher = uicontrol(f,'style','pushbutton','position',[0.60,0.95,0.25,0.04],'Value',[0],'String','Coisissez une image qui cache','Visible','on','Relief','default','SliderStep',[0.01,0.1],'FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','Callback','S2=pbLoad_callback2(handles)');

bouton_cacher = uicontrol(f,'style','pushbutton','position',[0.18,0.28,0.17,0.04],'Value',[0],'String','Cacher l image ->','Visible','on','Relief','default','SliderStep',[0.01,0.1],'FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal', 'Callback', 'image_mixe=cacher_RGB(S1,S2);')



//** Fonctions pour cacher **//
function s=cacher(a,b)
n=size(a);
s0=double(zeros(n))
a=double(a);
b=double(b);
s0=floor(a/16)*16+floor(b/16);
s=uint8(s0);
endfunction


function s=cacher_RGB(a,b)
s=a;
for i = 1:3
ac=a(:,:,i);
bc=b(:,:,i);
s(:,:,i)=cacher (ac,bc);
image_mixe=uicontrol(f,'style','image','string','image_mixe.png','position',[480 55 350 350],'HorizontalAlignment','center','VerticalAlignment','middle');
imwrite(s,'image_mixe.png');
end
endfunction






